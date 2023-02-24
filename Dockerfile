FROM jupyter/all-spark-notebook
# [TODO] UPDATE image from based on CI/CD Var 
# [TODO] commit image latest tag to chiefsgit.local container repository
USER root
RUN usermod -aG root jovyan
RUN usermod -aG sudo jovyan
RUN apt-get install sudo
RUN export DNDIR="/home/jovyan/.dotnet/"
RUN echo "jovyan ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
ENV export 'DEBIAN_FRONTEND=noninteractive'
ENV SLF4J_API_VERSION=1.7.29
ENV LZ4_JAVA=1.6.0
ENV SNAPPY_JAVA=1.1.7.3
ENV ESHADOOP_VERSION=7.5.2
ENV ESHADOOP_DIR=${JUPYTER_DIR}/esadoop
ENV JUPYTER_DIR=/opt/jupyterlab
RUN echo "PATH=/home/jovyan/anaconda/bin:/home/jovyan/.dotnet:/home/jovyan/.local/bin:/root/.local/bin:$PATH" > /etc/.bashrc || \
echo "PATH=/home/jovyan/anaconda/bin:/home/jovyan/.dotnet:/home/jovyan/.local/bin:/root/.local/bin:$PATH" > /etc/profile
# who is jovyan? ---> Found the answer...lol...funny folks... https://github.com/jupyter/docker-stacks/issues/358
RUN echo "PATH=$PATH" >> /etc/profile
ENV PATH=${PATH}
COPY requirements.txt ${JUPYTER_DIR}/requirements.txt
COPY hadoop.tar.gz ${ESHADOOP_DIR}/hadoop.tar.gz
RUN mkdir -p ${JUPYTER_DIR}/notebooks
COPY ./notebooks/ ${JUPYTER_DIR}/notebooks/
RUN useradd -G sudo,adm,users -m jupyteruser -s /bin/bash
RUN apt update -y
RUN apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 -y
RUN wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh | bash -b -
RUN conda config --set auto_activate_base True
RUN apt-get install apt-utils -y
RUN apt install -y python3 
RUN python3 -m pip install --upgrade pip 
RUN apt-get install python3-dev python3-setuptools -y
RUN apt-get upgrade -y
RUN apt clean -y
USER jovyan
ENV PATH=${PATH}
RUN python3 -m pip install --upgrade pip 
RUN python3 -m pip install --user --upgrade pip 
RUN python3 -m pip install --user --upgrade wheel 
RUN python3 -m pip install -r ${JUPYTER_DIR}/requirements.txt --user 
USER root
RUN mkdir -v ${ESHADOOP_DIR} || true
RUN tar -xzf ${ESHADOOP_DIR}/hadoop.tar.gz -C ${ESHADOOP_DIR} || true
#######################################################################################################################################################
# Manual Download - Quicker than wget
# These and the MS DOTNET were Donte's 7 levels of Dependency Hell
# [TODO] Host packages locally on chiefsgit.local
#######################################################################################################################################################
# RUN wget https://repos.spark-packages.org/graphframes/graphframes/0.8.0-spark2.4-s_2.11/graphframes-0.8.0-spark2.4-s_2.11.jar -P ${SPARK_HOME}/jars/
# RUN wget https://repo1.maven.org/maven2/org/apache/spark/spark-sql-kafka-0-10_2.12/3.1.3/spark-sql-kafka-0-10_2.12-3.1.3.jar -P ${SPARK_HOME}/jars/ 
# RUN wget https://repo1.maven.org/maven2/org/apache/kafka/kafka_2.12/3.2.1/kafka_2.12-3.2.1.jar -P ${SPARK_HOME}/jars/
# RUN wget https://repo1.maven.org/maven2/org/apache/kafka/kafka_2.12/3.2.1/kafka_2.12-3.2.1.jar -P ${SPARK_HOME}/jars/ 
# RUN wget https://repo1.maven.org/maven2/org/slf4j/slf4j-api/${SLF4J_API_VERSION}/slf4j-api-${SLF4J_API_VERSION}.jar -P ${SPARK_HOME}/jars/ 
# RUN wget https://repo1.maven.org/maven2/org/spark-project/spark/unused/1.0.0/unused-1.0.0.jar -P ${SPARK_HOME}/jars/ 
# RUN wget https://repo1.maven.org/maven2/org/lz4/lz4-java/${LZ4_JAVA}/lz4-java-${LZ4_JAVA}.jar -P ${SPARK_HOME}/jars 
# RUN wget https://repo1.maven.org/maven2/org/xerial/snappy/snappy-java/${SNAPPY_JAVA}/snappy-java-${SNAPPY_JAVA}.jar -P ${SPARK_HOME}/jars/
#######################################################################################################################################################
# Keep source wget uri/file as comments for future reference
#######################################################################################################################################################
RUN apt-get install -y apt-transport-https && sudo apt-get update
COPY ./jars/* ${SPARK_HOME}/jars/
RUN cp ${SPARK_HOME}/jars/graphframes* ${SPARK_HOME}/graphframes.zip 
COPY spark/* ${SPARK_HOME}/conf/
RUN apt install libssl1* -y
RUN apt update -y && apt upgrade -y
RUN apt-get update -y
RUN apt remove 'dotnet*' 'aspnet*' 'netstandard*'
RUN rm /etc/apt/sources.list.d/microsoft-prod.list || true
RUN wget https://packages.microsoft.com/config/ubuntu/22.04/prod.list
RUN wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
RUN chown root:root /etc/apt/sources.list.d/microsoft-prod.list
RUN dpkg --purge packages-microsoft-prod && dpkg -i packages-microsoft-prod.deb
RUN apt-get update -y && apt-get install -y dotnet-sdk-7.0 -y
RUN apt-get install -y dotnet-runtime-7.0
RUN conda run dotnet tool install Powershell -g
RUN conda run dotnet tool install -g Microsoft.dotnet-interactive
USER jovyan
RUN pip install powershell_kernel 
RUN pip install numpy 
RUN pip install pandas 
RUN pip install bash_kernel
RUN pip install powershell-kernel
RUN conda install -c conda-forge bash_kernel
RUN python -m powershell_kernel.install --powershell-command pwsh
RUN pip install py2neo plotly altair ipywidgets scipy bokeh pyreadline 
RUN pip install jupyterlab_widgets 
RUN pip install "jupyterlab>=3" "ipywidgets>=7.6" 
RUN jupyter nbextension enable --py widgetsnbextension
RUN pip install --quiet --no-cache-dir jupyter_contrib_nbextensions 
RUN pip install contrib  
RUN conda install geopandas
RUN pip install nbextensions
RUN pip install jupyterlab-spellchecker 
RUN pip install snippets_menu_magic 
RUN pip install jupyter-nbextensions-configurator 
RUN pip install nb2py  
RUN pip install nb-search 
RUN pip install nb2pdf
RUN conda install -c conda-forge featuretools
RUN conda install -c conda-forge python-graphviz
RUN conda install -c conda-forge xeus-sql
RUN conda install -c conda-forge black
RUN conda install -c conda-forge jupyterlab-spellchecker
RUN pip install jupyterlab_code_formatter 
RUN conda install -c conda-forge nodejs 
USER root
RUN apt-get -qy clean autoremove
RUN usermod -aG root jovyan
RUN ln -s ~/.dotnet/tools/pwsh /usr/bin/pwsh;
RUN ln -s ~/.dotnet/tools/dotnet-interactive /usr/bin/dotnet-interactive
USER jovyan

