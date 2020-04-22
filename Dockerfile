FROM node
LABEL org.label-schema.version=v1.1
RUN useradd -ms /bin/bash node_user
USER node_user
ADD src/ /home/node_user
WORKDIR /home/node_user
RUN npm install
EXPOSE 3000
CMD ./bin/www

git clone https://github.com/linuxacademy/content-weather-app.git src

docker image build -t linuxacademy/weather-app-nonroot:v1 .

docker container run -d --name weather-app-nonroot -p 8086:3000 linuxacademy/weather-app-nonroot:v1

curl localhost:8086
