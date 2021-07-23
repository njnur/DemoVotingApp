# Import Python Image from Dockerhub
FROM python:3.8-alpine3.13

ENV PYTHONUNBUFFERED 1

# Define dicrectory where the code will reside
WORKDIR /home/code

# Check if any changes in requirements.txt
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy existing files
COPY . .

# Run database migrations
RUN python manage.py migrate

RUN python manage.py collectstatic
