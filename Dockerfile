
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

RUN aws --version

# Download the file from AWS S3 using the AWS CLI
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_DEFAULT_REGION

# Set an environment variable with the ARG value
ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
ENV AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION

# Copy your application files into the container
# Copy HTML and Python script to the container
COPY index.html /usr/share/nginx/html/
COPY show_ip_and_date.js /usr/share/nginx/html/
#COPY sbs-world-cup.jpeg /usr/share/nginx/html/

# Expose any necessary ports
EXPOSE 80

# Define the command to run your application
CMD ["sh", "-c", "aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID && \
                  aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY && \
                  aws configure set default.region $AWS_DEFAULT_REGION && \
                  ls && \
                  aws s3 cp s3://sbsimages/sbs-world-cup.jpeg /usr/share/nginx/html/ && \
                  nginx -g 'daemon off;'"]
