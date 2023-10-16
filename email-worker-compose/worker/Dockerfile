FROM python:3.6
LABEL maintainer 'Cristiano Mendonça <cirstiano at cristtiano.mendonca@gmail.com>'
# Configurado para não usar buffer
ENV PYTHONUNBUFFERED 1
RUN pip install redis==2.10.5
ENTRYPOINT ["/usr/local/bin/python"]