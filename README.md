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
    3. Construye el contenedor en base a la imagen Docker:
    ```sh
    docker run -p 8080:8080 flask-app
    ```


4. Abre tu navegador y ve a `http://localhost:8080` para ver la aplicación en funcionamiento.

## Código **Python**🐍
```python


from flask import Flask, render_template, request, redirect, url_for
app = Flask(__name__)

# Sample data
tasks = [
    {'id': 1, 'title': 'Task 1', 'completed': False},
    {'id': 2, 'title': 'Task 2', 'completed': True},
]

@app.route('/')
def index():
    return render_template('index.html', tasks=tasks)

@app.route('/add', methods=['POST'])
def add_task():
    new_task = {
        'id': len(tasks) + 1,
        'title': request.form['title'],
        'completed': False
    }
    tasks.append(new_task)
    return redirect(url_for('index'))

@app.route('/complete/<int:task_id>')
def complete_task(task_id):
    for task in tasks:
        if task['id'] == task_id:
            task['completed'] = True
            break
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
```

    
    ```

- `Dockerfile`: Define cómo se construye la imagen Docker para la aplicación.
    ```dockerfile
    FROM python:3.8-slim

    WORKDIR /app

    COPY requirements.txt requirements.txt
    RUN pip install -r requirements.txt

    COPY . .

    CMD ["python3", "app.py"]
    ```

- `compose.yaml`: Define los servicios para Docker Compose.


## Notas

- Asegúrate de tener Docker y Docker Compose instalados en tu máquina.
- Puedes modificar `index.html` en el directorio `templates/` para cambiar la apariencia de la aplicación.

