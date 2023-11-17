# AppTicketing

AppTicketing is an application fork from Hesk : https://github.com/luketainton/hesk-docker

It's an application of ticketing management. We are a group of student, and our goal is to improve the application as a website service, where the clients and providers are specific entities, who will interact on the system. 

## Installation

The application is divided into 3 containers : 
- The http server (Apache) where the website is running.
- The database (MySQL)
- The PhpMyAdmin to control the database data's.

### Docker-compose
You can run the docker-compose script with
```bash
./launch.sh
```
The script for windows will come later.
## Usage

The website by default will be available at `localhost:8080/`

The PhpMyAdmin interface is available at `localhost:8081/`