# 黑域一键补丁Linux服务端
- 版本v0.2.1beta
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
- <code>./start.sh</code>
- 尝试连接
- 如需查看日志则在该目录中<code>cat output.log</code>
## Bug
- You tell me (Github issue)
