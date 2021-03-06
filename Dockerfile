FROM python:3.6-alpine

LABEL maintainer "s@muelcolvin.com"

RUN pip install dnslib==0.9.7

RUN mkdir /zones /block
ADD ./example_zones.txt /zones/zones.txt
ADD ./block.json /block/block.json

ADD ./dnserver.py /home/root/dnserver.py
EXPOSE 53/tcp
EXPOSE 53/udp
CMD ["/home/root/dnserver.py"]
