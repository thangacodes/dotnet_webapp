# .NET Core Web API application
I used my own AWS account to spin up an EC2 machine, which I used to test and build this entire source code into a Docker image, then ran a Docker container to run the Web application.
It is necessary to install Docker on the machine where you are doing docker builds, and to run the Docker daemon on that machine. 

# Pre-checks:
a) Docker Engine should be installed via YUM command,
$ sudo yum install -y docker
$ sudo systemctl start docker.service
$ sudo systemctl status docker.service
$ sudo usermod -aG docker $USER

Initially, I cloned the given code from mail to my Linux box, where I debugged and tested the source code in Docker containers. The source code structure should look like this after composing Dockerfile,
# tree super-service/
super-service/
├── Dockerfile
├── Time
├── src
│   ├── Controllers
│   │   └── TimeController.cs
│   ├── Model
│   │   ├── IClock.cs
│   │   └── WallClock.cs
│   ├── Program.cs
│   ├── Properties
│   │   └── launchSettings.json
│   ├── Startup.cs
│   ├── SuperService.csproj
│   ├── appsettings.Development.json
│   └── appsettings.json
└── test
    ├── MockClock.cs
    ├── SuperService.UnitTests.csproj
    └── TimeControllerTests.cs
5 directories, 14 files

# Making Docker Image:
In order to build the Docker images, I composed a Dockerfile and moved it to the source code folder, using the following commands,
$ docker build -t sourceimage .
$ docker images
$ docker run --name webapp -d -p 8080:80 sourceimage
$ docker ps 
In order to see if the application is working properly, use the following URL on the browser,
http://52.66.206.163:8080/Time
<img width="348" alt="image" src="https://github.com/thangacodes/dotnet_webapp/assets/38905243/39fc815a-4ffe-4d66-b2c2-f8a4f70022cf">


Please note, I referred to this page to build docker image from a .net application given source code.
https://learn.microsoft.com/en-us/dotnet/core/docker/build-container?tabs=windows&pivots=dotnet-8-0#create-the-dockerfile 
