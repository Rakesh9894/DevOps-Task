# Base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --production

# Copy rest of the code (app.js + logo file etc.)
COPY . .

# Expose port
EXPOSE 3000

# Run the app
CMD ["npm", "start"]

