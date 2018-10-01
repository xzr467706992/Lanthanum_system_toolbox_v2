#!/usr/bin/env python
# encoding: utf-8
# Author: Liu DongMiao <liudongmiao@gmail.com>
# Modified By Pzqqt <pzqqt88198@gmail.com>

import locale
import os
import sys
import shutil


plus_flag = False

MESSAGE_ZH_TW = {
    '%s not exists%s': '無法找到檔案 %s%s',
    '%s patched %s%s': '成功為 %s 打了 %s 處補丁%s',
    '%s patched %s, should patch %s%s': '為 %s 打了 %s 處補丁，應該打 %s 處%s',
    'copying %s%s': '正在拷貝%s%s',
}

MESSAGE_ZH = {
    '%s not exists%s': '无法找到文件 %s%s',
    '%s patched %s%s': '成功为 %s 打了 %s 处补丁%s',
    '%s patched %s, should patch %s%s': '为 %s 打了 %s 处补丁，应该打 %s 处%s',
    'copying %s%s': '正在复制 %s%s',
}

def _(message):
    # 对要在终端打印的字符串进行翻译和编码(仅在Python 2.x需要编码)
    lang, encoding = locale.getdefaultlocale()
    if not lang or not lang.startswith("zh"):
        return message
    if lang.startswith("zh_TW"):
        translate = MESSAGE_ZH_TW.get(message, message)
    else:
        translate = MESSAGE_ZH.get(message, message)
    if hasattr(translate, 'decode'):
        return translate.decode('utf8').encode(encoding)
    else:
        return translate

class Patch(object):
    def __init__(self, dir_services='services'):
        # services.jar文件反编译后的路径 默认值为services
        self.dir_services = dir_services

    def build_path(self, paths, dir_path=None):
        # 组合dir_path和paths路径(dir_path + paths)
        # 由于paths字符串已定并且使用"/"作为路径分割符
        # 所以这样做可以使其同时兼容win平台和Linux平台
        if dir_path is None:
            # 如果可选参数dir_path没有提供 则使用self.dir_services
            # 再往上推 其实就是"services"目录
            dir_path = self.dir_services
        # os.path.normpath(path)方法：规范path字符串形式
        # 例如：
        # path = r'D:\A\B\..\C'
        # 则 os.path.normpath(path) == r'D:\A\C'
        # ~ path = os.path.normpath(dir_path)
        # ~ for x in paths.split("/"):
            # ~ path = os.path.join(path, x)
        # 上面两行代码可以像这样简写为一行吗？可以！
        # ~ path = os.path.join(path, *paths.split("/"))
        # ~ return path
        
        # 一行代码 简单粗暴
        return os.path.join(os.path.normpath(dir_path), *paths.split("/"))

    def run(self):
        patched = 0
        # get_path方法定义了要打补丁的文件路径
        path = self.build_path(self.get_path())
        if not os.path.exists(path):
            sys.stderr.write(_("%s not exists%s") % (path, os.linesep))
            raise SystemExit(1)

        output = open(path + ".patched", "w")
        for line in open(path, "r"):
            # 打补丁动作在此
            # 逐行读取smali文件 并调用patch方法
            # 如果打补丁成功 则已打补丁处数(patched)加1
            # 否则直接写入*.smali.patched文件
            if self.patch(output, line):
                patched += 1
            else:
                output.write(line)
        output.close()
        # remove .smali
        # 移除*.smali文件(实际是重命名为*.smali.orig文件)
        # 并将刚才打好补丁的smali文件(*.smali.patched)重命名为*.smali
        # os.path.basename(path): 返回文件名
        # 此处切片[:-6] 略过字符".smali" 也就是文件后缀
        path_name = os.path.basename(path)[:-6]
        if patched == self.get_patch_count():
            os.rename(path, path + ".orig")
            os.rename(path + ".patched", path)
            sys.stdout.write(_("%s patched %s%s") % (
                path_name, patched, os.linesep))
        else:
            sys.stderr.write(_("%s patched %s, should patch %s%s") % (
                path_name, patched, self.get_patch_count(), os.linesep))
            raise SystemExit(2)
        return patched

    def init_pr_methods(self, fixing, smali_path, dir_apk):
        # 初始化Prevent的方法(methods)
        # 用意？从apk目录中的指定smali文件中获取所有的method语句体
        # 为什么要获取？这是补丁版黑域自己定义的method
        # 使用它来替换原本的method以达到劫持的目的
        # 此方法在下面的ActivityManagerService类中有使用
        path = self.build_path(smali_path, dir_apk)
        methods = {}
        # method_signature 应该是起到了一个信号的作用 表示method语句的开始
        # method_body method完整语句体 最终得到的字符串将包括".method" 和 ".end method"语句
        # method_name method名
        method_name = method_signature = method_body = ''
        for line in open(path, "r"):
            line_strip = line.strip()
            if line.startswith(".method"):
                method_signature = line_strip
                method_body = line
                method_name = self.find_method_name(method_signature)
            elif line.startswith(".end method"):
                method_body += line
                # 如果method名在预设的fixing集合里
                # 则添加元素到methods列表里
                if method_name in fixing:
                    methods[method_signature] = (method_name, method_body)
                method_name = method_signature = method_body = ''
            elif line_strip.startswith(".line"):
                # 跳过".line"行
                continue
            elif method_signature:
                method_body += line
        return methods

    def get_path(self):
        raise NotImplemented # 预先定义类的方法 直接调用则会...

    def get_patch_count(self):
        raise NotImplemented

    def patch(self, output, line):
        raise NotImplemented

    @staticmethod # 装饰器 类的静态方法 不会对任何实例类型进行操作 可以理解为此方法与self无关
    def find_method_name(line):
        # 看起来这个函数是返回smali的方法名的
        # 例如：
        # line = "method public abstract setVersion(I)V"
        # 则调用此函数后返回： "setVersion"
        
        # 找出字符串line中第一次出现"("的位置索引
        end = line.index("(")
        # 找出字符串line中最后一次出现" "的位置索引 指定范围：开头(0) -> 第一次出现"("的位置索引(end)
        start = line.rindex(" ", 0, end)
        # 返回line的切片(start + 1 到 end)
        return line[start + 1:end]

    @staticmethod
    def get_method_arguments(line):
        if line.strip().startswith("iget-object"):
            return [a[:-1] for a in line.strip().split()[1:3]]
        # 获取smali的method参数
        start = line.index("{")
        end = line.index("}", start)
        argument = line[start + 1:end]
        # 如果argument中有".."字符串(省略了一些参数)
        # 例如：
        # line = "invoke-virtual/range {p0 .. p8}, Lcom/andro(后略)"
        # 此时argument = "p0 .. p8"
        if '..' in argument:
            # 函数partition()
            # 作用：按分割符将字符串分割为3部分 返回一个3元的元组
            # 第一个为分隔符左边的子串 第二个为分隔符本身 第三个为分隔符右边的子串
            # strip() 剔除字符串两侧空白
            start, _, end = [x.strip() for x in argument.partition("..")]
            sn = int(start[1:])
            en = int(end[1:])
            # 若argument的首尾参数不是以同一字母开头则抛出异常
            # 字母？在smali语法中 p开头的寄存器为参数寄存器 v开头的寄存器为本地寄存器
            assert start[0] == end[0]
            prefix = start[0]
            arguments = []
            for x in range(sn, en + 1):
                arguments.append("%s%d" % (prefix, x))
            return arguments
        else:
            return [x.strip() for x in argument.split(",")]
        # 最终返回argument包含的所有参数的列表
        # 例如：
        # argument  = "p0, p1, p2, p3"
        # 则返回 ["p0", "p1", "p2", "p3"]
        # argument  = "p0 .. p8"
        # 则返回 ["p0", "p1", "p2", "p3", "p4", "p5", "p6", "p7", "p8"]


class IntentResolver(Patch): # 注意！此类继承于上面的"Patch"类！

    def get_path(self):
        # 定义要打补丁的文件相对路径
        return "com/android/server/IntentResolver.smali"

    def patch(self, output, line):
        if 'Landroid/content/Intent;->isExcludingStopped(' in line:
            # 字符串的replace方法
            # 方法：replace(旧字符串, 新字符串[, 最大替换次数])
            new_line = line.replace("invoke-virtual/range", "invoke-static/range") \
                .replace("Landroid/content/Intent;->isExcludingStopped(",
                         "Lcom/android/server/am/PreventRunningUtils;->isExcludingStopped(Landroid/content/Intent;")
            output.write(new_line)
            # 返回新旧字符串是否相同 用以判断是打补丁是否成功
            # 不同则返回True 相同则返回False
            return new_line != line
        elif 'Landroid/content/IntentFilter;->match(' in line:
            new_line = line.replace("invoke-virtual/range", "invoke-static/range") \
                .replace("Landroid/content/IntentFilter;->match(",
                         "Lcom/android/server/am/PreventRunningUtils;->match(Landroid/content/IntentFilter;")
            output.write(new_line)
            return new_line != line
        # 此处应该有个"return None" 嘛。。。只是便于理解

    def get_patch_count(self):
        # 定义应打几处补丁
        return 2


class ActivityManagerService(Patch):
    methods = None
    pkg_deps = ''
    extra_count = 0
    method_name_sp = ""

    # 使用大括号创建了一个仅包含键的字典 称之为集合
    # 特点: 检索迅速 不会有重复值
    # 这个集合包含了所有要修正的method名
    # 即：用补丁版黑域自己的的method替代原本的method
    # 原本的method体不动 但method名重命名为"原method名"+"$Pr"
    # 至于如何替换 替换为什么样的代码 参考父类的init_pr_methods方法
    fixing = {'startProcessLocked', 'startActivity', 'handleAppDiedLocked', 'cleanUpRemovedTaskLocked',
              'moveActivityTaskToBack', 'startService', 'bindService', 'broadcastIntent'}

    def __init__(self, dir_services=None, dir_apk='apk'):
        if dir_services is None:
            # super() 函数: 用于调用父类(超类)的一个方法
            super(ActivityManagerService, self).__init__()
        else:
            super(ActivityManagerService, self).__init__(dir_services)
        self.dir_apk = dir_apk
        self.methods = self.init_pr_methods(self.fixing, self.get_path(), self.dir_apk)

    def get_path(self):
        return "com/android/server/am/ActivityManagerService.smali"

    def patch(self, output, line):
        line_strip = line.strip()
        
        # 跳过空行
        if not line_strip:
            return False
        
        # 跳过".line"行
        if line_strip.startswith(".line"):
            return False

        if line.startswith(".method"):
            method_signature = line_strip
            self.method_name_sp = self.find_method_name(line_strip)
            # 如果method体第一行在self.methods里也有
            if method_signature in self.methods:
                # 从self.methods中取出method名和method完整语句体
                method_name, method_body = self.methods[method_signature]
                # 如果method名在method名修正集合里
                if method_name in self.fixing:
                    # 写入新的method语句体
                    # 写入一个空行
                    # 把原本的method语句块的(首行的)method名末尾加上"$Pr"
                    # 最后从self.fixing中移除此method名 返回True
                    output.write(method_body)
                    output.write(os.linesep)
                    output.write(line.replace(method_name, method_name + "$Pr"))
                    self.fixing.remove(method_name)
                    return True
            # 此处应该有个"return None" 嘛。。。只是便于理解
            # 下面类似的地方就不补充注释了

        # 配合self.pkg_deps这个flag 判断此行是否需要重写
        if self.pkg_deps and 'Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z' in line_strip:
            output.write("    invoke-static {},"
                         " Lcom/android/server/am/PreventRunningUtils;->returnFalse()Z")
            output.write(os.linesep)
            # 此处patch比较特殊 故使用self.extra_count来特殊计数
            # 为什么特殊？此处Patch在4.4下是打不上的
            self.extra_count += 1
            self.pkg_deps = ''
            return True

        # 此处Patch仅用于killPackageProcessesLocked方法
        # 在8.x+中 有可能会给getPackageProcessState方法也打上补丁
        # 这样做是多余的 所以这里添加一个额外的条件判断
        if self.method_name_sp == "killPackageProcessesLocked":
            if line_strip.startswith('iget-object'):
                # self.pkg_deps用来设置一个flag 因为此行之后的一行需要重写
                # 对此行以"iget-object"开头的语句进行判断
                if 'Lcom/android/server/am/ProcessRecord;->pkgDeps:Landroid/util/ArraySet;' in line_strip:
                    self.pkg_deps = line_strip
                else:
                    self.pkg_deps = ''

    def get_patch_count(self):
        # 4.4 必打 8+0 处补丁
        # 5.x ~ 7.x 必打 8+1 处补丁
        # 8.x+ 只打 7+1 处补丁 属于正常情况
        global plus_flag
        if plus_flag:
            return 7 + self.extra_count
        else:
            return 8 + self.extra_count

    def run(self):
        super(ActivityManagerService, self).run()
        src = self.build_path("com/android/server/am/", self.dir_apk)
        dest = self.build_path("com/android/server/am/", self.dir_services)
        # 复制apk目录下文件名以PreventRunning开头的文件 到services目录下(需要复制三个文件)
        for path in os.listdir(src):
            if path.startswith("PreventRunning"):
                sys.stdout.write(_("copying %s%s") % (path[:-6], os.linesep))
                shutil.copy(os.path.join(src, path), dest)


class ActivityStack(Patch):
    # 此类和IntentResolver类类似 不再详解

    patched = 0
    method_name_sp = ""
    arg_sp = ""
    arg2_sp = ""

    def get_path(self):
        return "com/android/server/am/ActivityStack.smali"

    def patch(self, output, line):
        # 写得非常不清真的代码
        if line.startswith(".method"):
            self.method_name_sp = self.find_method_name(line.strip())
        if self.method_name_sp == "resumeTopActivityInnerLocked":
            if "Landroid/app/IApplicationThread;->scheduleResumeActivity(Landroid/os/IBinder;" in line:
                output.write(line)
                output.write(os.linesep)
                # 父类定义的get_method_arguments方法: 获取smali的method参数 返回参数列表
                # 取此列表的第一个参数赋值给argument变量
                argument = self.get_method_arguments(line)[1]
                output.write("    invoke-static/range {%s .. %s},"
                             " Lcom/android/server/am/PreventRunningUtils;"
                             "->onResumeActivity(Landroid/os/IBinder;)V" % (argument, argument))
                output.write(os.linesep)
                self.patched += 1
                return True
            if line.strip().startswith("invoke-virtual"):
                if "Lcom/android/server/am/ActivityRecord;->clearOptionsLocked()V" in line:
                    self.arg_sp = self.get_method_arguments(line)[0]
            if "Lcom/android/server/am/ClientLifecycleManager;->scheduleTransaction" in line:
                output.write(line)
                output.write(os.linesep)
                arguments = self.get_method_arguments(line)
                assert self.arg_sp
                output.write("    iget-object %s, %s, Lcom/android/server/am/ActivityRecord;"
                             "->appToken:Landroid/view/IApplicationToken$Stub;"
                             % (arguments[0], self.arg_sp))
                output.write(os.linesep)
                output.write(os.linesep)
                output.write("    invoke-static {%s}, Lcom/android/server/am/PreventRunningUtils;"
                             "->onResumeActivity(Landroid/os/IBinder;)V" % arguments[0])
                output.write(os.linesep)
                self.patched += 1
                arg_sp = ""
                arg2_sp = ""
                return True
        if self.method_name_sp == "destroyActivityLocked":
            if "Landroid/app/IApplicationThread;->scheduleDestroyActivity(Landroid/os/IBinder;" in line:
                output.write(line)
                output.write(os.linesep)
                argument = self.get_method_arguments(line)[1]
                output.write("    invoke-static/range {%s .. %s},"
                             " Lcom/android/server/am/PreventRunningUtils;"
                             "->onDestroyActivity(Landroid/os/IBinder;)V" % (argument, argument))
                output.write(os.linesep)
                self.patched += 1
                return True
            if line.strip().startswith("iget-object"):
                if "Lcom/android/server/am/ActivityRecord;->app:Lcom/android/server/am/ProcessRecord;" in line:
                    self.arg_sp = self.get_method_arguments(line)[1]
            if "Lcom/android/server/am/ClientLifecycleManager;->scheduleTransaction" in line:
                output.write(line)
                output.write(os.linesep)
                arguments = self.get_method_arguments(line)
                assert self.arg_sp
                output.write("    iget-object %s, %s, Lcom/android/server/am/ActivityRecord;"
                             "->appToken:Landroid/view/IApplicationToken$Stub;"
                             % (arguments[0], self.arg_sp))
                output.write(os.linesep)
                output.write(os.linesep)
                output.write("    invoke-static {%s}, Lcom/android/server/am/PreventRunningUtils;"
                             "->onDestroyActivity(Landroid/os/IBinder;)V"
                             % (arguments[0]))
                output.write(os.linesep)
                self.patched += 1
                arg_sp = ""
                arg2_sp = ""
                return True
        if self.method_name_sp == "startPausingLocked":
            if "Landroid/app/IApplicationThread;->schedulePauseActivity(Landroid/os/IBinder;ZZ" in line:
                output.write(line)
                output.write(os.linesep)
                arguments = self.get_method_arguments(line)
                # 判断参数列表的第2~4个参数是否以同一字母开头
                if arguments[1][0] == arguments[2][0] == arguments[3][0]:
                    output.write("    invoke-static/range {%s .. %s},"
                             " Lcom/android/server/am/PreventRunningUtils;"
                             "->onUserLeavingActivity(Landroid/os/IBinder;ZZ)V" % (arguments[1], arguments[3]))
                else:
                    # join函数: 以指定字符串连接序列中的元素
                    # 语法: str.join(sequence)
                    # 举例: str = "-"; seq = ("a", "b", "c"); strings = str.join(seq)
                    # 则 strings == "a-b-c"
                    output.write("    invoke-static {%s},"
                             " Lcom/android/server/am/PreventRunningUtils;"
                             "->onUserLeavingActivity(Landroid/os/IBinder;ZZ)V" % ', '.join(arguments[1:4]))
                             # 注意: 此处切片[1:4]包含3个元素而不是4个！
                output.write(os.linesep)
                self.patched += 1
                return True
            if line.strip().startswith("iget-object"):
                if "Lcom/android/server/am/ActivityStack;->mResumedActivity:Lcom/android/server/am/ActivityRecord;" in line:
                    self.arg_sp = self.get_method_arguments(line)[0]
            if "Landroid/app/servertransaction/PauseActivityItem" in line:
                self.arg2_sp = self.get_method_arguments(line)[1]
            if "Lcom/android/server/am/ClientLifecycleManager;->scheduleTransaction" in line:
                output.write(line)
                output.write(os.linesep)
                arguments = self.get_method_arguments(line)
                assert (self.arg_sp and self.arg2_sp)
                output.write("    iget-object %s, %s, Lcom/android/server/am/ActivityRecord;"
                             "->appToken:Landroid/view/IApplicationToken$Stub;"
                             % (arguments[0], self.arg_sp))
                output.write(os.linesep)
                output.write(os.linesep)
                output.write("    iget-boolean %s, %s, Lcom/android/server/am/ActivityRecord;->finishing:Z"
                             % (arguments[1], self.arg_sp))
                output.write(os.linesep)
                output.write(os.linesep)
                output.write("    invoke-static {%s, %s, %s}, Lcom/android/server/am/PreventRunningUtils;"
                             "->onUserLeavingActivity(Landroid/os/IBinder;ZZ)V"
                             % (arguments[0], arguments[1], self.arg2_sp))
                output.write(os.linesep)
                self.patched += 1
                arg_sp = ""
                arg2_sp = ""
                return True
                

    def get_patch_count(self):
        # 打补丁的次数可能会多于3次？
        if self.patched > 3:
            return self.patched
        else:
            return 3


class ActivityStackSupervisor(Patch):
    # 同上 不再详解

    patched = 0
    extra_count = 0

    methods = None
    fixing = {'cleanUpRemovedTaskLocked',}
    arg_sp = ""

    def __init__(self, dir_services=None, dir_apk='apk'):
        if dir_services is None:
            super(ActivityStackSupervisor, self).__init__()
        else:
            super(ActivityStackSupervisor, self).__init__(dir_services)
        self.dir_apk = dir_apk
        self.methods = self.init_pr_methods(self.fixing, self.get_path(), self.dir_apk)


    def get_path(self):
        return "com/android/server/am/ActivityStackSupervisor.smali"

    def patch(self, output, line):
        
        line_strip = line.strip()
        
        if not line_strip:
            return False
        
        if line_strip.startswith(".line"):
            return False

        if line.startswith(".method"):
            method_signature = line_strip
            if method_signature in self.methods:
                method_name, method_body = self.methods[method_signature]
                if method_name in self.fixing:
                    output.write(method_body)
                    output.write(os.linesep)
                    # 注意！
                    # 这里不仅要把旧的method体的method名末尾加上"$Pr"
                    # 还要在前面加上"private " 将其转为私有方法
                    output.write(line.replace(method_name, "private %s$Pr" % method_name))
                    self.fixing.remove(method_name)
                    self.extra_count += 1
                    self.patched += 1
                    return True
        
        if "Landroid/app/IApplicationThread;->scheduleLaunchActivity(Landroid/content/Intent;Landroid/os/IBinder;" in line:
            output.write(line)
            output.write(os.linesep)
            arguments = self.get_method_arguments(line)
            argument = arguments[2]
            output.write("    invoke-static/range {%s .. %s},"
                         " Lcom/android/server/am/PreventRunningUtils;"
                         "->onLaunchActivity(Landroid/os/IBinder;)V" % (argument, argument))
            output.write(os.linesep)
            self.patched += 1
            return True

    def get_patch_count(self):
        if self.extra_count:
            global plus_flag
            plus_flag = True
            # 生成一个flag文件 以帮助bat批处理判断是否是8.x+的services.jar
            # 事后删除
            # 若并非用于工具自带的批处理 可酌情将下方两行删掉或注释掉
            with open("plus_flag.txt", "w") as f:
                f.write("plus_flag")
        # 7.x以及7.x之前: 1处或N处(加行xN, N>=1)
        # 8.x: 1+1处或1+N处(方法Hook + 加行xN, N>=1)
        # 9.0: 1处(方法Hook)
        if self.patched > 1:
            return self.patched
        else:
            return 1


def main():
    # OptionParser这部分就不提了 如感兴趣 自行查阅相关资料
    from optparse import OptionParser

    parser = OptionParser()
    parser.add_option("-a", "--apk", dest="dir_apk", default="apk",
                      help="dir for apk", metavar="DIR")
    parser.add_option("-s", "--service", dest="dir_services", default="services",
                      help="dir for services", metavar="DIR")

    (options, args) = parser.parse_args()

    IntentResolver(options.dir_services).run()
    ActivityStack(options.dir_services).run()
    ActivityStackSupervisor(options.dir_services, options.dir_apk).run()
    ActivityManagerService(options.dir_services, options.dir_apk).run()


if __name__ == '__main__':
    main()

# vim: set sta sw=4 et:
