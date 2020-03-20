# @AUTHOR: imyme6yo "imyme6yo@gmail.com"
# @DRAFT: 20200320

# ARGUMENTs
ARG NODE_VERSION=13.10.1
ARG ALPINE_VERSION=3.10

FROM node:${NODE_VERSION}-alpine${ALPINE_VERSION}

# Labels
# Maintainer
LABEL maintainer="imyme6yo"
LABEL email="imyme6yo@gmail.com"

# ENVs
ENV HOST 0.0.0.0
ENV PROJECT tictactoe

# Arguments
ARG DIR=code
ARG PORT=9214

# Install Alpine Packages
RUN apk update && apk upgrade
RUN apk --no-cache add git

# Create Project by Default Settings
RUN mkdir ${DIR}
WORKDIR ${DIR}
COPY . .
WORKDIR ${PROJECT}

EXPOSE 9214