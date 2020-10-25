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

RUN apt install -y git \
        curl
        
# c.f. https://github.com/theme-next/hexo-theme-next/issues/1454
RUN wget https://github.com/jgm/pandoc/releases/download/2.10.1/pandoc-2.10.1-1-amd64.deb

RUN dpkg -i pandoc-2.10.1-1-amd64.deb

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
