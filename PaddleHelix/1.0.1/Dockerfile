# Use an official Miniconda image as the base
FROM continuumio/miniconda3

# Set working directory in the container
WORKDIR /app

# Labels
LABEL base_image="continuumio/miniconda3"
LABEL version="1"
LABEL software="PaddleHelix"
LABEL software.version="1.0.1"
LABEL about.summary="A machine-learning-based bio-computing framework"
LABEL about.home="https://github.com/PaddlePaddle/PaddleHelix"
LABEL about.documentation="https://paddlehelix.readthedocs.io/en/dev/"
LABEL about.license_file="https://github.com/PaddlePaddle/PaddleHelix/blob/dev/LICENSE"
LABEL about.license="Apache-2.0"
LABEL extra.identifiers.biotools="paddlehelix"
LABEL about.tags="Bioinformatics"

# Create a new conda environment with Python 3.7
RUN conda create -n paddlehelix python=3.7 -y

# Use the conda environment
SHELL ["conda", "run", "-n", "paddlehelix", "/bin/bash", "-c"]

# Install rdkit
RUN conda install -c conda-forge rdkit -y

# Install paddlepaddle (GPU version)
RUN pip install paddlepaddle-GPU==2.1.0

# Install scikit-learn and other potential dependencies
RUN pip install scikit-learn numpy pandas

# Install pgl
RUN pip install pgl

# Set environment variable to allow deprecated sklearn package
ENV SKLEARN_ALLOW_DEPRECATED_SKLEARN_PACKAGE_INSTALL=True

# Install PaddleHelix
RUN pip install paddlehelix==1.0.1

# Default command to run
CMD ["python"]
