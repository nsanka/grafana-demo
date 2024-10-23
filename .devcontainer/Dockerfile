FROM debian:bullseye

# Set environment variables to reduce output from debconf
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
   apt-transport-https \
   software-properties-common \
   wget \
   gnupg \
   lsb-release \
   sudo \
   && rm -rf /var/lib/apt/lists/*

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /usr/share/keyrings/postgresql-archive-keyring.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/postgresql-archive-keyring.gpg] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN apt update && apt install -y \
   postgresql-17 \
   postgresql-client-17 \
   && rm -rf /var/lib/apt/lists/*

RUN sudo mkdir -p /etc/apt/keyrings/
RUN wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null

RUN echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

# Updates the list of available packages
RUN apt-get update

# Installs the latest OSS release:
RUN apt-get install -y grafana

COPY startUpScript.sh /usr/local/bin/startUpScript.sh
RUN chmod +x /usr/local/bin/startUpScript.sh

# Clean up
RUN apt-get -y autoremove && apt-get -y clean

# Grafana Server
EXPOSE 3000
RUN sudo update-rc.d grafana-server defaults

# Update the PATH variable
ENV PATH="${PATH}:/usr/lib/postgresql/17/bin"

CMD ["/usr/local/bin/startUpScript.sh"]
