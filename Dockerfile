FROM ubuntu:18.04
RUN echo "root:12345aa" | chpasswd
RUN apt update
RUN apt install -y wget
RUN DEBIAN_FRONTEND=noninteractive apt install dropbear -y
RUN wget https://github.com/erebe/wstunnel/releases/download/v3.1/wstunnel-x64-linux && chmod +x /wstunnel-x64-linux
RUN echo '/wstunnel-x64-linux --server ws://0.0.0.0:8080' > /tmp/runner.sh
RUN chmod +x /tmp/runner.sh

CMD dropbear -p 2222; /tmp/runner.sh