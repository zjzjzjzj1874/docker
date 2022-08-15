FROM nginx

# 以参数形式决定当前编辑哪个环境的配置
ARG mode

COPY ./dist/ /usr/share/nginx/html/
COPY ./nginx/${mode}.conf /etc/nginx/conf.d/hello-ui.conf

EXPOSE 80
