# flask-docker

Este proyecto es una aplicación web simple utilizando Flask y Docker.

## Estructura del Proyecto

- `app.py`: Contiene el código principal de la aplicación Flask.
- `compose.yaml`: Archivo de configuración para Docker Compose.
- `Dockerfile`: Define la imagen Docker para la aplicación.
- `README.md`: Este archivo.
- `requirements.txt`: Lista de dependencias de Python necesarias para la aplicación.
- `res.txt`: Archivo de recursos adicionales.
- `templates/`: Directorio que contiene las plantillas HTML.
  - `index.html`: Plantilla principal de la aplicación.

## Requisitos

- Docker
- Docker Compose

## Instalación y Uso

1. Clona este repositorio:
    ```sh
    git clone <URL_DEL_REPOSITORIO>
    cd flask-docker
    ```

2. Construye la imagen Docker:
    ```sh
    docker build -t flask-docker .
    ```

3. Ejecuta la aplicación usando Docker Compose:
    ```sh
    docker-compose up
    ```

4. Abre tu navegador y ve a `http://localhost:5000` para ver la aplicación en funcionamiento.

## Explicación del Código

- `app.py`: Define una aplicación Flask simple que renderiza `index.html` en la ruta raíz (`/`).
    ```python
    from flask import Flask, render_template

    app = Flask(__name__)

    @app.route('/')
    def home():
        return render_template('index.html')

    if __name__ == '__main__':
        app.run(host='0.0.0.0', port=5000)
    ```

- `Dockerfile`: Define cómo se construye la imagen Docker para la aplicación.
    ```dockerfile
    FROM python:3.8-slim

    WORKDIR /app

    COPY requirements.txt requirements.txt
    RUN pip install -r requirements.txt

    COPY . .

    CMD ["python", "app.py"]
    ```

- `compose.yaml`: Define los servicios para Docker Compose.
    ```yaml
    version: '3'
    services:
      web:
        build: .
        ports:
          - "5000:5000"
    ```

## Notas

- Asegúrate de tener Docker y Docker Compose instalados en tu máquina.
- Puedes modificar `index.html` en el directorio `templates/` para cambiar la apariencia de la aplicación.

¡Disfruta desarrollando con Flask y Docker!# flask-docker
