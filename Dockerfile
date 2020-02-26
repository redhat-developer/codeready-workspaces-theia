# Copyright (c) 2020 Red Hat, Inc.
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#   Red Hat, Inc. - initial API and implementation
#

# https://access.redhat.com/containers/?tab=tags#/registry.access.redhat.com/ubi8/nodejs-10
FROM registry.access.redhat.com/ubi8/nodejs-10:1-66
USER root

# this script requires a github personal access token
ARG GITHUB_TOKEN=YOUR_TOKEN_HERE

# set alternate branches and versions if required
ARG CHE_THEIA_BRANCH=7.9.x
ARG THEIA_BRANCH=master
ARG NODE_VERSION=10.16.3
ARG YARN_VERSION=1.17.3
ENV NODEJS_VERSION=10 \
    PATH=$HOME/node_modules/.bin/:$HOME/.npm-global/bin/:/usr/bin:$PATH
WORKDIR /projects

RUN yum install -y java-1.8.0-openjdk curl bzip2 python36 && \
    npm install -g node@${NODE_VERSION} yarn@${YARN_VERSION} && \
    ln -s /usr/bin/node /usr/bin/nodejs && \
    for f in "${HOME}" "/opt/app-root/src/.npm-global"; do \
      chgrp -R 0 ${f} && \
      chmod -R g+rwX ${f}; \
    done
COPY build.sh conf ./
RUN ./build.sh --ctb ${CHE_THEIA_BRANCH} --tb ${THEIA_BRANCH} --all \
      --no-tests --no-cache
