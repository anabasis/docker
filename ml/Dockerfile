FROM ubuntu:latest
LABEL jscho <jscho@time-gate.com>

ENV OS_GROUP root
ENV OS_USER root

WORKDIR /opt

# Setup Anconda Base
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH=/opt/conda/bin:$PATH

# WGET,VIM,BZIP2,GIT,CA-CERTIFICTES 설치
RUN apt-get update && apt-get install -y wget vim bzip2
RUN apt-get update --fix-missing && apt-get install -y git ca-certificates

# WGET ANACONDA 설치
RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

# Install basic frameworks
RUN conda install -n base pytorch cpuonly -c pytorch && \
    conda install -c anaconda tensorflow

# conda install nodejs -c conda-forge --repodata-fn=repodata.json
RUN conda install -n base nb_conda waitress datashader && \
#    conda install -n base -c conda-forge "nodejs>=10.0.0" jupyterlab jupyterlab-git dask-ml dask-labextension dask-xgboost "spacy==2.3.2" fbprophet pomegranate shap lime umap-learn tslearn kmodes imbalanced-learn pymc3 stumpy tqdm mlflow && \
    conda install nodejs -c conda-forge --repodata-fn=repodata.json && \
    conda install jupyterlab && \
    conda install jupyterlab-git dask-ml dask-labextension dask-xgboost "spacy==2.3.2" fbprophet pomegranate shap lime umap-learn tslearn kmodes imbalanced-learn pymc3 stumpy tqdm mlflow && \
    jupyter labextension install dask-labextension && \
    jupyter serverextension enable --py --sys-prefix dask_labextension --user && \
    pip install jupyter-tensorboard && \
    jupyter labextension install jupyterlab_tensorboard && \
    jupyter serverextension enable --py --sys-prefix jupyter_tensorboard && \
    jupyter tensorboard enable --user && \
    python -m spacy download en_core_web_sm && \
    pip install pyarrow>=3.0.0 vaex>=4.0.0 causalnex bocd spacytextblob==0.1.7 && \
    jupyter lab build && \
    jupyter lab clean && \
    pip install pyopenssl && \
    apt-get install -y build-essential && \
    pip install pyfim
RUN pip install rrcf auto-sklearn

RUN conda clean --all -f -y && \
    find "/opt/conda" -depth \( -type f -a -name '*.pyc' -o -name '*.pyo' -o -name '*.a' -o -name '*.js.map' \) -exec rm -rf '{}' \;

RUN mkdir /dltk
# Define working directory
WORKDIR /srv


# add splunk:splunk user
#RUN groupadd -r $OS_GROUP \
#    && useradd -r -m -g $OS_GROUP $OS_USER \
#    && echo groupadd -r $OS_GROUP \
#    && echo useradd -r -m -g $OS_GROUP $OS_USER

#RUN cd /opt \
#  && RUN sudo apt-get install -y wget sudo tar net-tools
