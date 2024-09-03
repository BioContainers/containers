# Use an official Miniconda image as the base
FROM continuumio/miniconda3

# Set working directory in the container
WORKDIR /app

# Create a new conda environment
RUN conda create -n paddlehelix python=3.7 -y

# Use the conda environment
SHELL ["conda", "run", "-n", "paddlehelix", "/bin/bash", "-c"]

# Install rdkit
RUN conda install -c conda-forge rdkit -y

# Install paddlepaddle
RUN pip install paddlepaddle

# Install scikit-learn and other potential dependencies
RUN pip install scikit-learn numpy pandas

RUN pip install pgl

# Set environment variable to allow deprecated sklearn package
ENV SKLEARN_ALLOW_DEPRECATED_SKLEARN_PACKAGE_INSTALL=True

RUN pip install paddlehelix

CMD ["python"]
