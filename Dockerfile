FROM ubuntu:14.04
MAINTAINER Rob Bernabé "rob@rob.pe"

RUN apt-get -qqy update && DEBIAN_FRONTEND=noninteractive apt-get install -y python-virtualenv
RUN virtualenv /root/venv && /root/venv/bin/pip install Django

WORKDIR /root
RUN /root/venv/bin/django-admin.py startproject myproject

CMD ["/root/venv/bin/python", "/root/myproject/manage.py", "runserver", "0.0.0.0:8000"]

EXPOSE 8000
