#!/bin/bash
## 自动yum安装Docker，Docker配置yum源  2018-05-16
## http://www.aqzt.com
## email: ppabc@qq.com
## robert yu
## redhat 7

##安装
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo http://mirrors.selinux.cn/help/docker-aliyun.repo
yum makecache fast
yum -y install docker-ce
chkconfig docker on

##配置docker源
tee /etc/systemd/system/docker.service <<-'EOF'
[Unit]
Description=Docker Application Container Engine
Documentation=https://docs.docker.com
After=network.target firewalld.service

[Service]
Type=notify
ExecStart=/usr/bin/dockerd --registry-mirror=https://4ux5p520.mirror.aliyuncs.com
ExecReload=/bin/kill -s HUP $MAINPID
LimitNOFILE=infinity
LimitNPROC=infinity
LimitCORE=infinity
TimeoutStartSec=0
Delegate=yes
KillMode=process

[Install]
WantedBy=multi-user.target
EOF

##启动
service docker start
systemctl daemon-reload
service docker restart
docker version

#
# docker 常用命令
#
# 启动docker：systemctl start docker
#
# 停止docker：systemctl stop docker
#
# 重启docker：systemctl restart docker
#
# 查看docker状态：systemctl status docker
#
# 开机启动：systemctl enable docker
#
# 查看docker概要信息：docker info
#
# 查看docker帮助文档：docker --help
#
# systemctl status docker.service 查看详细错误。
#
#
#删除所有容器
#
#docker rm `docker ps -a -q`
#1
#2、删除所有镜像
#
#docker rmi `docker images -q`
#1
#3、按条件删除镜像
#
#没有打标签
#
#docker rmi `docker images -q | awk '/^<none>/ { print $3 }'`
#1
#镜像名包含关键字
#
#docker rmi --force `docker images | grep mysql | awk '{print $3}'`    //其中doss-api为关键字
#
# 综上，我们可以写出以下脚本列出所有容器对应的名称，端口，及ip
# docker inspect -f='{{.Name}} {{.NetworkSettings.IPAddress}} {{.HostConfig.PortBindings}}' $(docker ps -aq)
#
#
# 容器端口映射主机
#https://www.cnblogs.com/x_wukong/p/10041071.html
#