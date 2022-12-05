FROM adoptopenjdk:11-jre-hotspot

RUN apt-get update -y && \
	apt-get install -y nginx=1.18.0-0ubuntu1.4 \
		-y libnginx-mod-http-lua=1.18.0-0ubuntu1.4

RUN mkdir -p /opt/app/test_access

COPY test_access/ /opt/app/test_access/

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY script.sh /opt/app/script.sh
RUN chmod +x /opt/app/script.sh  \
		/opt/app/test_access/print.sh
EXPOSE 80

CMD ["sh","-c","/opt/app/script.sh"]
