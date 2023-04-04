# Use a lightweight base image with Node.js
FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Install a basic web server (e.g., serve)
RUN npm install -g serve

# Copy the built web assets to the container
COPY build/web /app

# Expose the port the web server will run on
EXPOSE 8080

# Start the web server
CMD ["serve", "-s", ".", "-l", "8080"]