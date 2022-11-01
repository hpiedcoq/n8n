# My pimped version of n8n

This n8n version is a dockerized app that contains a TOR service, python, and several python tools to increase the possibilities of using n8n for osint purposes.

n8n is an open-source automation tool. https://github.com/n8n-io/n8n

## Installation

### Prerequisites

You need docker and docker-compose on your machine to use this app.


### Building and run the image

```docker-compose up -d``` should do the trick.

### Useful addons

n8n is already a really powerful tool. But I add some useful python packages such as js, trafilatura, dnstools to enhance its possibilities.

In order to use these packages, simply create a workflow that will contain the "execute command" module, where you type the desired command. example : ```dig soa lemonde.fr```

To use TOR, simply  use the command ```torify curl http://monip.org```.

Using this, you will be able to use the generate content in n8n. 