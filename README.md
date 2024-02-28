#Documentation of the criation and dockerization process

 #1# First, this is the original tree file of the project:
SimpleFlask
├── app.py
├── Dockerfile
├── requirements.txt
├── 
└── venv
    ├── 
    └──

 #2# The main file is the app.py, which is a website homepage with a simple phrase


 #3#  The dockerfile explanation:
#The following line tells Docker to use a pyhton base image, version 3.8, 'slim' means a version with the minimum 
#libraries and tools required to execute the application, and the 'buster' refers to the OS Debian included on the img 
FROM python:3.8-slim-buster

#Establish a directory to be use for the rest of the operations, its inside the container
WORKDIR /projetobase

#Now we copy everything inside the directory /SimpleFlask (local) to inside the /projetobase directory inside
#the container, and to install environment requirements inside the container.
COPY . /projetobase
RUN pip install -r requirements.txt

COPY . .

#Instructions for docker to run our Flask app as a module (-m), and makes it available from our browser
#The '--host=0.0.0.0' could also be included on app.py, on the last line after the 'debug=True'...
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]


 #4# After finishing the Dockerfile we can build the image with the command:
docker build --tag zotti39/simple-flask:1.0 .

 #5# And run the container :
docker run -d -p 5006:5000 --name 'NAME' zotti39/simple-flask:1.0
#In this case we will redirect the website (default port 5000) to the host port 5006 
#And the website will be available on the http://localhost:5006


