# Use Node.js 14 as required by the project criteria.
FROM node:14

# Set the working directory inside the container.
WORKDIR /app

# Copy the entire application source code into the container.
COPY . .

# Run the app in production mode and point the database host to item-db.
ENV NODE_ENV=production DB_HOST=item-db

# Install production dependencies and build the application assets.
RUN npm install --production --unsafe-perm && npm run build

# Expose the application port used in production mode.
EXPOSE 8080

# Start the application server when the container runs.
CMD ["npm", "start"]
