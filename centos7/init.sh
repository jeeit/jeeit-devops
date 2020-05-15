cat << EOF
 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 开始安装JDK1.8 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
EOF

yum install java-1.8.0-openjdk* -y

java -version


cat << EOF
默认jre jdk 安装路径是/usr/lib/jvm 下面
EOF

#配置环境变量
vim /etc/profile

export  JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.201.b09-2.el6_10.x86_64
export  PATH=$PATH:$JAVA_HOME/bin
export  CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/jre/lib/rt.jar







