FROM node:17.9 as builder

RUN yarn config set registry https://registry.npmmirror.com/

WORKDIR /app

COPY . /app
COPY ./deploy /app/deploy

ARG buildEnv=dev
ENV NODE_OPTIONS=--openssl-legacy-provider

RUN cd /app \
    && yarn install \
    && yarn run build:${buildEnv}

FROM nginx

WORKDIR /app/frontend-a

COPY --from=builder /app/dist dist
COPY --from=builder /app/deploy/nginx/nginx.conf /etc/nginx/conf.d/
