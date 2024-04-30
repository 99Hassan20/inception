FROM debian:bookworm

RUN apt update && apt upgrade -y && apt install -y nginx && apt install -y openssl\
 && openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/hoigag.42.key -out /etc/nginx/hoigag.42.crt -sha256 -days 3650 -nodes -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=hoigag.42.fr"

COPY conf/default  /etc/nginx/sites-available
# COPY install
# COPY index.html /usr/share/nginx/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]