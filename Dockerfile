FROM jupyter/scipy-notebook:latest

LABEL Author="Victor Fernandez III, @cyberphor"

RUN rmdir "${HOME}/work"

COPY Jupyter-Notebooks/*.ipynb "${HOME}"

WORKDIR "${HOME}"