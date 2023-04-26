FROM python:3.9-slim-buster

WORKDIR /app

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl python3-distutils software-properties-common && \
    # add-apt-repository ppa:deadsnakes/ppa \
    # apt install python3.9 python3.9-distutils \
    rm -rf /var/lib/apt/lists/*

# Download and install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 - --version 1.4.0
ENV PATH="/root/.local/bin:${PATH}"
ENV PATH="/root/.poetry/bin:${PATH}"


# Copy the current directory contents into the container at /app
COPY . /app

RUN poetry install 

# Expose port 8000 for gunicorn
EXPOSE 8000

# Run the command to start gunicorn
CMD ["poetry", "run", "gunicorn", "app:server", "--bind", "0.0.0.0:8000"]
