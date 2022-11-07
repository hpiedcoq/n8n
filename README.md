# My pimped version of n8n

This n8n version is a dockerized app that contains a TOR service, python, and several python tools to increase the possibilities of using n8n for osint purposes.

n8n is an open-source automation tool. https://github.com/n8n-io/n8n

## Installation

### Prerequisites

You need docker and docker-compose on your machine to use this app.

This should work on a raspberry pi, like a charm. For this purpose, the docker-compose.yaml file is set to 500mb of memory and one processor. If your machine is more powerful, don't hesitateto allow more! ;)


### Building and run the image

Create an empty n8n directory at the root of the directory.

Then just type : ```docker-compose up -d``` which should do the trick : build the image and start n8n.

To stop n8n, type : ```docker-compose down```.
### Useful addons

n8n is already a really powerful tool. But I add some useful python packages such as js, trafilatura, dnstools to enhance its possibilities.

In order to use these packages, simply create a workflow that will contain the "execute command" module, where you type the desired command. example : ```dig soa lemonde.fr```

To use TOR, simply  use the command ```torify curl http://monip.org```.

Using this, you will be able to use the generated content in n8n. 


### Persistence

The data are stored in the n8n directory for persistence.

### Usage

Once launched, just type in your browser : ```localhost:5678```

Enjoy n8n.