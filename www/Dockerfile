FROM nginx
LABEL Author=bqliu<1174980997@qq.com>

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY ./www.bqliu.com-chain.crt /etc/nginx/
COPY ./www.bqliu.com.key /etc/nginx/
RUN echo 'This is my fancy secure website.' > /usr/share/nginx/html/index.html
