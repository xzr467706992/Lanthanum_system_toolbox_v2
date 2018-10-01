# 黑域一键补丁Linux服务端
- 版本v0.3.1beta
### 原料
- 一台Linux服务器
### 搭建过程
- ssh连接
- 依次运行下列命令(以下操作基于Debian9测试)
- <code>apt-get update</code>
- <code>apt install git</code>
- <code>apt install openjdk-8-jdk-headless</code>
- <code>git clone -b prevent_server_linux https://github.com/xzr467706992/Lanthanum_system_toolbox_v2.git prevent_server</code>
- <code>cd prevent_server</code>
- 配置config （格式参见分支[prevent_server_win](https://github.com/xzr467706992/Lanthanum_system_toolbox_v2/blob/prevent_server_win/README.md))&&当然你可能需要<code>apt install vim</code>来为你提供一个编辑器（具体自行谷歌vim的用法)
- <code>./start.sh</code>
- 尝试连接
- 如需查看日志则在该目录中<code>cat output.log</code>
### 获取最新服务端
- 在服务器文件夹中使用<code>git pull</code>
## Bug
- You tell me (Github issue)
