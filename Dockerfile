FROM python:3.10-alpine
WORKDIR /app
COPY ./my_app ./

RUN pip install --upgrade pip --no-cache-dir

RUN pip install -r /app/requirements.txt --no-cache-dir

# CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

CMD ["gunicorn", "main_app.wsgi:application", "--bind", "0.0.0.0:8000"]

