FROM mhart/alpine-node:8.1.2
LABEL Name=microservice.bugReport Version=1.0.0 
COPY package.json /tmp/package.json
RUN cd /tmp \
    && npm config set strict-ssl false \
    # && npm config set @icoastline:registry=http://npm.gtscloud.cc/ \
    && npm config set registry=https://registry.npm.taobao.org/ \
    && npm install --production 
    # && npm install -g typescript 
RUN mkdir -p /usr/src/app && mv /tmp/node_modules /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app
EXPOSE 80
CMD node app.js