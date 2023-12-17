
# Use a base image
FROM nginx:alpine
MAINTAINER Vivek Aundkar <vivekaundkar@gmail.com>


# Install AWS CLI to interact with S3
RUN apk --no-cache add \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install awscli \
    && apk --purge -v del py3-pip

# Create a directory for your application
WORKDIR /app

# Copy your application files into the container
# Copy HTML and Python script to the container
COPY index.html /usr/share/nginx/html/
COPY show_ip_and_date.js /usr/share/nginx/html/

# Expose any necessary ports
EXPOSE 80

# Define the command to run your application
CMD ["sh", "-c", "nginx -g 'daemon off;'"]
