# Import Python Image from Dockerhub
FROM python:3.8-alpine

# Set Python environment
ENV PYTHONDONTWRITEBYTECODE 1  # prevents Python from writing pyc files to disc
ENV PYTHONUNBUFFERED 1  # prevents Python from buffering stdout and stderr

# Install psycopg2 dependencies
RUN apk update \
&& apk add postgresql-dev gcc python3-dev musl-dev

# Define dicrectory where the code will reside
WORKDIR /home/code

# Check if any changes in requirements.txt
COPY requirements.txt .

# Install the required dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy existing files
COPY . .
