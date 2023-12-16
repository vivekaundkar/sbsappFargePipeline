# Use a lightweight base image with nginx
FROM nginx:alpine

# Copy HTML and Python script to the container
COPY index.html /usr/share/nginx/html/
COPY update_date.py /usr/share/nginx/html/

# Make the Python script executable
RUN chmod +x /usr/share/nginx/html/update_date.py

# Expose the port your app will run on
EXPOSE 80

# Start the nginx server
CMD ["nginx", "-g", "daemon off;"]
