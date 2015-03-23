# rubedo-docker-mongodb
Launch 3rd after data and elasticsearch:
sudo docker run --name test_mongodb -p IP:9002:9001 -p IP:27017:27017 --volumes-from test_data --restart="always" -d webtales/rubedo-docker-mongodb