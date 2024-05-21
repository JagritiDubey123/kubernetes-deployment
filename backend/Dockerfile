FROM node
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY backend/package.json ./
# COPY backend/package.json /usr/src/app
RUN npm install
# COPY . .
COPY backend/. .
EXPOSE 8000
EXPOSE 3306
CMD ["node", "app.js"]
# COPY . /usr/src/app
