# Use the official Node.js image as the base image
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Clone Uptime Kuma from the GitHub repository
RUN git clone https://github.com/louislam/uptime-kuma.git .

# Install dependencies
RUN npm install

# Build the Uptime Kuma application
RUN npm run build

# Expose port 3001
EXPOSE 3001

# Start Uptime Kuma
CMD ["node", "server/server.js"]
