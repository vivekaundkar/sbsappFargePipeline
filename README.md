Nginx Docker Image - SBS App with IP Address and Current Date
This Docker project demonstrates a basic Nginx server serving a static HTML page that displays the client's IP address and the current date. The IP address is fetched using the IPify API, and the date is formatted as YEAR/MONTH/DATE HOUR:MIN:SECS using JavaScript.

Getting Started
Prerequisites
Docker installed on your system.
Build and Run the Docker Image
Clone this repository:

bash
Copy code
git clone git@github.com:vivekaundkar/sbsappFargePipeline.git
cd sbsappFargePipeline
Build the Docker image:
docker run -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_DEFAULT_REGION -p 8080:80 sbsapp:latest


Access the web application in your browser at http://localhost:8080/.

Project Structure
Dockerfile: Defines the instructions to build the Docker image.
index.html: HTML file with JavaScript code to display IP address and current date.
show_ip_and_date.js: JavaScript file that fetches the IP address and formats the current date.
Customization
Date Format: You can customize the date format in show_ip_and_date.js by modifying the options object in the updateCurrentDate function.

TO create and push docker image to ECR follow below commands
docker login -u 

setup environment variables with AWS creds and then run
docker build \
  --build-arg AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  --build-arg AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  --build-arg AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
  -t sbsapp:latest .

Run docker container and test locally using
docker run -p 8080:80 sbsapp:latest

you can verify web site locally using url
http://localhost:8080/

Next tag and push this image to ECR
aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin 239338699850.dkr.ecr.ap-southeast-2.amazonaws.com

docker tag sbsapp:latest 239338699850.dkr.ecr.ap-southeast-2.amazonaws.com/vivekrepo:latest

docker push 239338699850.dkr.ecr.ap-southeast-2.amazonaws.com/vivekrepo:latest
