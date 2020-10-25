FROM node:13-stretch

LABEL "name"="hexo-github-action"
LABEL "maintainer"="yrpang <yrpang@outlook.com>"
LABEL "version"="0.1.0"

LABEL "com.github.actions.name"="Hexo GitHub Action"
LABEL "com.github.actions.description"="A GitHub action used to automatic generate and deploy hexo-based blog."
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="green"

COPY README.md LICENSE entrypoint.sh /

RUN apt update

RUN apt install git \
        openssh \
        curl \
        pandoc

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
