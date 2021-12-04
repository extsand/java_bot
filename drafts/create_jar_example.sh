#!/bin/bash
# way to create jar file

https://jbot.devops-academy-kh.click/
jbot-load-balancer-1102407421.eu-north-1.elb.amazonaws.com



export ENV APP_WEBHOOK_LINK=link-to-loadbalancer.com
export ENV APP_BOT_USERNAME=@name-of-bot
export ENV APP_BOT_TOKEN=23443298bottockenexample

mvn package
mvn install -D skipTests


# java woring in console
# more https://rtfm.co.ua/java-rabota-s-jar-arxivami-iz-konsoli-linux/
# example commands

# depack
jar xf oracle.jar oracle/

jar cf oracle.jar add_me
#pack
jar cfv oracle.jar oracle/



logging.level.org.springframework.web: trace
logging.level.org.apache: trace



Если вы используете шлюз AWS api в сочетании с каналом VPC, и если в балансировщике сетевой нагрузки включен протокол прокси v2, также произойдет неправильный запрос 400.
https://coderoad.ru/42218237/Tomcat-java-lang-IllegalArgumentException-%D0%9D%D0%B5%D0%B4%D0%BE%D0%BF%D1%83%D1%81%D1%82%D0%B8%D0%BC%D1%8B%D0%B9-%D1%81%D0%B8%D0%BC%D0%B2%D0%BE%D0%BB-%D0%BD%D0%B0%D0%B9%D0%B4%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9-%D0%B2-%D0%B8%D0%BC%D0%B5%D0%BD%D0%B8

docker pull tomcat
docker run -it -p 80:8080 tomcat:latest

java-tom
3.71.26.145
apache
3.67.204.190

helthchecker
curl -I http://${IPADDR}:8080/health

curl -I http://3.71.26.145:8080/



Это может произойти из-за разбора заголовков HTTPS вместо HTTP. Попробуй:

Добавление:
logging.level.org.springframework.web: trace
logging.level.org.apache: trace
к вашему application.properties и посмотрите, что говорит вам Spring.
Проверьте, есть ли в это время какие-либо запланированные действия, которые относятся к другому ресурсу, зашифрованному SSL. См. Также: java.lang.IllegalArgumentException: Недопустимый символ, найденный в имени метода. HTTP имена методов должны быть токенами