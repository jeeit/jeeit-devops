docker安装Mysql
https://www.jianshu.com/p/d6febf6f95e0


宿主机项目连接docker容器内的mysql
https://blog.csdn.net/weixin_43468326/article/details/93872573

mysql 开启远程连接
select user，host from mysql.user;

update user set host = '%' where user = 'root';


mysql 不区分大小写



docker run --name mysql \
    --restart=always \
    -p 3306:3306 \
    -v /opt/docker-mysql/conf.d:/etc/mysql/conf.d \
    -v /opt/docker-mysql/var/lib/mysql:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -d mysql:5.6.45