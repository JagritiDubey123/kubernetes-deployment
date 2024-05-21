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

# Use a Node.js base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json if available
COPY package*.json ./

# Install backend dependencies
RUN npm install

# Copy the rest of the backend application code
COPY . .

# Expose the port the backend app runs on
EXPOSE 8000

# Command to run the backend app
CMD ["node", "app.js"]
