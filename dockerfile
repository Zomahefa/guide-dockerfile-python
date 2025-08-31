FROM debian:12
RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

#definir le repertoire de travail
WORKDIR /app

# Copier le code de l’application dans l’image
COPY  app/ /app/

RUN pip3 install --no-cache-dir --break-system-packages -r requirements.txt



CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]


