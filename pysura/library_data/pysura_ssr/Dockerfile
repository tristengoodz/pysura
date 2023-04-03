# Use the official Nginx image as the base image
FROM nginx:stable-alpine

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d

# Copy the Flutter web build assets to the Nginx html directory
COPY build/web /usr/share/nginx/html

# Expose the port Nginx is running on (default is 80)
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]