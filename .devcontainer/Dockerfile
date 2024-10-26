# Pull any postgis docker image
FROM postgis/postgis:15-master

# Update
RUN apt-get update

# Install the dependencies
RUN apt install -y \
   apt-transport-https \
   software-properties-common \
   wget \
   pip \
   libpq-dev \
   postgresql-server-dev-15 \
   sudo \
   vim \
   && rm -rf /var/lib/apt/lists/*
RUN pip install pgxnclient cmake

# Install the H3 extension for postgres
RUN pgxn install h3

# Install Grafana
RUN sudo mkdir -p /etc/apt/keyrings/
RUN wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null

RUN echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

# Updates the list of available packages
RUN apt-get update

# Installs the latest OSS release:
RUN apt-get install -y grafana

# Remove the dev dependencies
RUN pip uninstall -y pgxnclient cmake
RUN apt purge -y libpq-dev postgresql-server-dev-15 pip

# Clean up
RUN apt-get -y autoremove && apt-get -y clean

# Update the PATH variable
ENV PATH="${PATH}:/usr/lib/postgresql/17/bin"
ENV PATH="${PATH}:/usr/share/grafana/bin"
