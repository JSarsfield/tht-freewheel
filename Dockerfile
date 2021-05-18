# syntax=docker/dockerfile:1
FROM tensorflow/tensorflow:latest-jupyter
COPY startup.sh /
RUN pip install pyspark mlflow scikit-learn xgboost hyperopt jupyterlab xeus-python &&\
    chmod +x /startup.sh

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME && \
    curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh && \
    apt install -y nodejs && \
    jupyter labextension install @jupyterlab/debugger

CMD /startup.sh