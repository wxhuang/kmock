FROM node:12-alpine

ENV ENV_TYPE docker
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./package.json /tmp/package.json
RUN cd /tmp && npm i --registry=https://registry.npm.taobao.org
RUN mkdir -p /node-app && mv /tmp/node_modules /node-app

WORKDIR /node-app
COPY . /node-app

ARG BUILD_VERSION
ENV VERSION=${BUILD_VERSION}

CMD ["npm", "start"]
