# ===== Dockerfile for compute_bench.py =====
# Use official PyTorch image with CUDA support (Python 3.9+)
FROM --platform=linux/amd64 pytorch/pytorch:2.0.0-cuda11.7-cudnn8-runtime

# Set working directory inside the container
WORKDIR /app

# Copy the compute_bench.py script into the container
COPY compute_bench.py /app/compute_bench.py

# Ensure Python prints output directly to console
ENV PYTHONUNBUFFERED=1

# Default command to run the benchmark script
CMD ["python", "/app/compute_bench.py"]
