# Use the official Node.js 14 image as the base
FROM node:12 as react-build

# Set the working directory inside the container
WORKDIR /app

# Copy the rest of the app's source code to container
COPY . .

RUN npm install

# Build the React app
RUN npm run build


# Stage 2 - the production environment
# Use a lightweight web server to serve the static files
FROM nginx:alpine

# Copy the built app from the previous stage to the nginx server
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=react-build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start the nginx server
CMD ["nginx", "-g", "daemon off;"]
