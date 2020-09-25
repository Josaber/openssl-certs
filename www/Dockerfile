FROM nginx
LABEL Author bqliu<bqliu@thoughtworks.com>

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY ./www.bqliu.com.crt /etc/nginx/
COPY ./www.bqliu.com.key /etc/nginx/
RUN echo 'This is my fancy secure website.' > /usr/share/nginx/html/index.html
