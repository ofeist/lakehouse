# lakehouse

- to build and push the image to ghcr.io:
cd hive-metastore
sudo docker build -f Dockerfile.hms-standalone -t hive-metastore-standalone:3.1.3 .
sudo -E ./publish.sh
