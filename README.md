# Class2dex
#### 这是一个简单的基于android sdk制作的，可以将Java的class转为android的dex的工具
## 使用方法：
- 获取本工具(windows) 直接下载或 `git clone https://github.com/xzr467706992/Lanthanum_system_toolbox_v2 -b class2dex`
1. 将需要转换的文件名称改为in.jar，放置于class2dex.bat同级目录
2. 点击class2dex.bat
3. 生成的out.jar即为转换结果

- 如果该out.jar要被作为一个镧·系统工具箱的模块，那么请将其名称改为与入口的class相同。
- 如入口为`public class Test implements LModule`,那么请将out.jar的名称改为Test.jar，否则无法被正常读取。
## 无法正常工作？
- 请配置完整的java环境，并且不要使用jdk11而是使用[jdk8](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
- 需要配置`Path`,`JAVA_HOME`,`CLASSPATH`等jdk8所需[环境变量](https://jingyan.baidu.com/article/6dad5075d1dc40a123e36ea3.html)
