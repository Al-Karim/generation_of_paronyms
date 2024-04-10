FROM python:3.9.7

WORKDIR /home/

COPY train.py /home/ 
COPY inference.py /home/ 
COPY server.py /home/
COPY best_params.json /home/
COPY config.json /home/
COPY Data /home/

COPY requirements.txt /home/
RUN mkdir inference_binaries/

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install -r requirements.txt
RUN python3 ./train.py

EXPOSE 80

CMD ["uvicorn", "server:app", "--reload", "--host", "0.0.0.0", "--port", "80"]
