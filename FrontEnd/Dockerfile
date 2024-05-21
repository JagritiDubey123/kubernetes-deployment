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
COPY FrontEnd/. .
# COPY . .
# COPY . /usr/src/app
EXPOSE 5000
CMD ["node", "app.js"]
