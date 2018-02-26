# Node Alpine Base
FROM node:alpine
MAINTAINER jairo.correa@live.com


#add bash (for testing purposes)
RUN apk update && apk upgrade
RUN apk add bash



#Variables
# Environment variable#
#ENV HUBOT_SLACK_TOKEN your-pers-onal-slack-token
ENV HUBOT_SLACK_TOKEN xoxb-319053395125-S5giZm5Mxlnt1PFDnRZ8HlTk
ENV HUBOT_NAME myhubot
ENV HUBOT_OWNER admin
ENV HUBOT_DESCRIPTION Hubot
ENV EXTERNAL_SCRIPTS "hubot-help,hubot-pugme"

USER root
RUN npm install -g yo

#RUN addgroup -S bots
#RUN adduser -D -S hubot -G bots
USER node
WORKDIR /home/node

#WORKDIR /hubot
#Install Yeoman Generator


RUN npm install yo generator-hubot
RUN npm install hubot-slack --save
RUN npm install hubot-jenkins --save
RUN echo $PATH
#RUN /usr/local/bin/yo --version
RUN yo hubot --owner="${HUBOT_OWNER}" --name="${HUBOT_NAME}" --description="${HUBOT_DESCRIPTION}" --adapter="slack"

CMD ["bin/hubot", ""--adapter", "slack"]
