FROM python:3.11-slim
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
# Install Allure CLI
RUN apt-get update && apt-get install -y openjdk-11-jre wget unzip && \
    wget https://github.com/allure-framework/allure2/releases/download/2.13.8/allure-2.13.8.zip && \
    unzip allure-2.13.8.zip -d / && rm allure-2.13.8.zip
ENV PATH="/allure-2.13.8/bin:${PATH}"
CMD ["pytest", "--alluredir=allure-results"]

