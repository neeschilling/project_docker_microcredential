FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
COPY server.py .
COPY app/models /app/models
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8080
CMD ["python", "server.py"]

