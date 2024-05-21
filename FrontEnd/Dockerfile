# FROM node
# RUN mkdir -p /usr/src/app
# WORKDIR /usr/src/app
# # COPY FrontEnd/package.json /usr/src/app
# COPY FrontEnd/package.json ./
# RUN npm install
# COPY FrontEnd/. .
# # COPY . .
# # COPY . /usr/src/app
# EXPOSE 5000
# CMD ["node", "app.js"]

FROM node
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
# COPY FrontEnd/package.json /usr/src/app
COPY FrontEnd/package.json ./
RUN npm install
RUN npm audit fix --force

# Update npm to the latest version
RUN npm install -g npm@latest
COPY FrontEnd/. .
# COPY . .
# COPY . /usr/src/app
EXPOSE 5000
CMD ["node", "app.js"]
