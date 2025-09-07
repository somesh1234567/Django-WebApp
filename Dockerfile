FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt /app/
COPY django_web_app /app/

RUN pip install -r requirements.txt

RUN python manage.py makemigrations
RUN python manage.py migrate

EXPOSE 8000

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]