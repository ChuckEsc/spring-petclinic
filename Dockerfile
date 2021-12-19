# syntax=docker/dockerfile:1

# that tells Docker what base image we would like to use for our application
FROM openjdk:16-alpine3.13

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline

COPY src ./src

CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=mysql"]

# ======= 其它的一些Dockerfile命令 ========== 这里我们没有用到不过还是提一下
#COPY package.json /usr/src/app/
#ADD 更高级的复制文件
#ADD 指令和 COPY 的格式和性质基本一致。但是在 COPY 基础上增加了一些功能。
#CMD 指令就是用于指定默认的容器主进程的启动命令的。
#ENV 设置环境变量
#HEALTHCHECK 健康检查
#EXPOSE 指令是声明运行时容器提供服务端口，这只是一个声明，在运行时并不会因为这个声明应用就会开启这个端口的服务

