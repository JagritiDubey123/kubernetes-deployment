# FROM node
# RUN mkdir -p /usr/src/app
# WORKDIR /usr/src/app
# COPY backend/package.json ./
# # COPY backend/package.json /usr/src/app
# RUN npm install
# # COPY . .
# COPY backend/. .
# EXPOSE 8000
# EXPOSE 3306
# CMD ["node", "app.js"]
# # COPY . /usr/src/app

# FROM node:14

# # Create app directory
# RUN mkdir -p /usr/src/app
# WORKDIR /usr/src/app

# # Copy package.json and package-lock.json
# COPY package.json /usr/src/app/

# # Install app dependencies
# RUN npm install

# # Bundle app source
# COPY . /usr/src/app

# EXPOSE 8000
# CMD [ "node", "src/index.js" ]

FROM node:14
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN cp backend/package.json /usr/src/app
RUN npm install
COPY . /usr/src/app
EXPOSE 8000
EXPOSE 3306
CMD ["npm", "start"]
