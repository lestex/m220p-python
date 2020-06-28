FROM python:3.8-alpine AS compile-image

RUN apk --no-cache add --virtual builds-deps \
    build-base libffi-dev openssl-dev python3-dev \
    libc-dev

COPY requirements /requirements
RUN pip install --no-cache-dir --user \
    -r /requirements/prod.txt --no-warn-script-location

EXPOSE 5000

COPY run.py /app/
COPY mflix /app/mflix

ENV PATH=/root/.local/bin:$PATH

WORKDIR /app

CMD ["gunicorn", "-b :5000", "run:app"]

# FROM python:3.8-alpine AS build-image
# COPY --from=compile-image /root/.local /root/.local

# ENV PATH=/root/.local/bin:$PATH

# RUN apk --no-cache add --virtual libc-dev