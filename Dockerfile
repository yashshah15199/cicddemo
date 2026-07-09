# Use precise platform flag for cloud compatibility
FROM --platform=linux/amd64 node:20-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy dependency manifests first to leverage Docker layer caching
COPY package*.json ./

# Install only production dependencies
RUN npm ci --only=production

# Copy the rest of your application code
COPY . .

# Expose the internal port your Express app listens on
EXPOSE 3000

# Specify runtime execution
CMD ["npm", "start"]