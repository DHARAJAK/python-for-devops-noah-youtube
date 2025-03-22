FROM python:3.8.13-slim-buster

RUN mkdir -p /app
COPY . main.py /app/
WORKDIR /app
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python -m textblob.download_corpora
EXPOSE 8080
CMD [ "main.py" ] 
ENTRYPOINT [ "python" ]

