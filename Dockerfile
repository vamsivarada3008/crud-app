# Base image
FROM node:14.17.5-alpine3.14

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire project to the working directory
COPY . .

# Build the project
RUN npm run build

# Set the environment variable for the production build
ENV NODE_ENV=production

# Expose the port on which the application will run
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
