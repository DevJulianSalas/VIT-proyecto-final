FROM python:3.12.7-slim-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*
RUN useradd --create-home --shell /bin/bash vision
WORKDIR /home/src
USER vision
ENV PATH="/home/vision/.local/bin:${PATH}"
COPY --chown=vision:vision requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt
COPY --chown=vision:vision ./src/ /home/src

RUN ls -la
RUN pwd


CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=9999", "--no-browser", "--allow-root", "--config=None"]