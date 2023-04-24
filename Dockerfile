FROM alpine:latest

LABEL Author="Victor Fernandez III, @cyberphor"

WORKDIR /opt/notebooks/

# Jupyter Lab requires the "psutil" and "y-py" Python packages:
# - "psutil" requires Linux Headers and python3-dev (interfaces between userspace and the Linux kernel) 
# - "y-py" requires Rust and Cargo (the Rust package manager)
RUN apk add --no-cache \
    linux-headers \
    rust cargo \ 
    python3 python3-dev py3-pip 

RUN python3 -m pip install jupyterlab

COPY ./Jupyter-Notebooks/* /opt/notebooks/

ENTRYPOINT [ "jupyter", "lab", "--allow-root", "--no-browser" ]