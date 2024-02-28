# Documentation of the criation and dockerization process

## 1. First, this is the original tree file of the project:
SimpleFlask
├── app.py 
├── Dockerfile
├── requirements.txt
├── README.md
├── templates
│   └── Homepage.html
├── static
│   └── style.css
└── venv
    └── (VirtualEnvironment for python files)

## 2. The main file is the app.py, which is a website homepage with a simple phrase
Atualização 1.1: a homepage foi levemente estilizada e agora não está mais inclusa no app.py, e sim no diretorio /templates
Tambem foi adicionado um documento css para dar um minimo de estilo a homepage
    
## 3. File app.py 
Na ultima linha do arquivo definimos host='0.0.0.0', que significa que o website será acessivel de qualquer maquina na mesma rede, para acessa-lo use 0.0.0.0:5000
OBS: esse website, nessas configurações não é acessivel de fora da rede local

## 4.  The dockerfile explanation:
The following line tells Docker to use a pyhton base image, version 3.8, 'slim' means a version with the minimum 
libraries and tools required to execute the application, and the 'buster' refers to the OS Debian included on the img 
- FROM python:3.8-slim-buster

Establish a directory to be use for the rest of the operations, its inside the container
- WORKDIR /projetobase

Now we copy only the essential files to the container directory and install environment requirements inside the container.
- COPY app.py .
- COPY requirements.txt .
- COPY templates templates
- COPY static static
- RUN pip install -r requirements.txt

Instructions for docker to run our Flask app as a module (-m),
- CMD [ "python3", "app.py"]


## 5. After finishing the Dockerfile we can build the image with the command:
docker build --tag zotti39/simple-flask:1.1 .

## 5.1 Now the creation of the image isnt necessary, because by commiting to the github repository, a github action workflow will create an image and push it to the docker hub repository automatically

## 6. And run the container :
docker run -d -p 5006:5000 --name 'NAME' zotti39/simple-flask:1.1

In this case we will redirect the website (default port 5000) to the host port 5006 
#And the website will be available on the http://localhost:5006


