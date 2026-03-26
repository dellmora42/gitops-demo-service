FROM python:3.13
LABEL authors="pdugan"

WORKDIR /app

COPY . .

RUN pip install build
RUN pip install .

EXPOSE 8000

CMD ["uvicorn", "src.hello_app.main:app", "--host", "0.0.0.0", "--port", "8000"]