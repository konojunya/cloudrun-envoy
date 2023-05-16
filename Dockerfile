FROM nginx

RUN rm -f /etc/nginx/conf.d/*

ADD nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]