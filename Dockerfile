# Use the official NGINX image as the base image
FROM nginx:latest

# Copy the index.html file into the default NGINX web root directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 to allow incoming HTTP traffic
EXPOSE 80

# The CMD instruction starts the NGINX server when the container runs
CMD ["nginx", "-g", "daemon off;"]
