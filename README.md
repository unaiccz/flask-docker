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
    docker run -p 8080:8080 flask-docker
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
 ## Dockerfile 🐋

```
    FROM python:3.8-slim

    WORKDIR /app

    COPY requirements.txt requirements.txt
    RUN pip install -r requirements.txt

    COPY . .

    CMD ["python3", "app.py"]
    ```

```
- `compose.yaml`: Define los servicios para Docker Compose en caso de tener multiples servicios o **contenedores**.

## Notas

- Asegúrate de tener Docker y Docker Compose instalados en tu máquina.
- Puedes modificar `index.html` en el directorio `templates/` para cambiar la apariencia de la aplicación.

## Deploy en vercel
## Documentación del archivo `vercel.json`

El archivo `vercel.json` es utilizado por Vercel para configurar el despliegue de tu aplicación. A continuación, se explica cada sección del archivo:

### Estructura del archivo `vercel.json`

```json
{
  "version": 2,
  "builds": [
    {
      "src": "app.py",
      "use": "@vercel/python"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "app.py"
    }
  ]
}



Explicación de los campos
version: Especifica la versión de configuración de Vercel. En este caso, se está utilizando la versión 2, que es la más reciente y recomendada.

builds: Define cómo Vercel debe construir tu proyecto.

src: Especifica el archivo de entrada que se utilizará para construir la aplicación, en este caso, app.py.
use: Especifica el runtime o builder que se utilizará. Aquí se está utilizando @vercel/python, que es el runtime para aplicaciones Python.
routes: Configura las rutas de la aplicación.

src: Define un patrón de ruta usando una expresión regular. En este caso, /(.*) coincide con todas las rutas.
dest: Especifica el destino al que se debe redirigir la ruta. Aquí, todas las rutas se redirigen a app.py.
Uso del archivo vercel.json
Este archivo debe estar en la raíz de tu proyecto. Cuando despliegues tu aplicación en Vercel, este archivo será utilizado para configurar y construir tu aplicación automáticamente.

Ejemplo de Despliegue en Vercel
Crear una cuenta en Vercel: Si aún no tienes una cuenta en Vercel, puedes crear una en vercel.com.
Conectar tu repositorio de GitHub: Autoriza a Vercel a acceder a tu cuenta de GitHub y selecciona el repositorio unaiccz/flask-docker.
Configurar el proyecto: Asegúrate de que el framework sea detectado correctamente y configura las variables de entorno necesarias.
Desplegar la aplicación: Haz clic en "Deploy" para iniciar el despliegue de tu aplicación.
Verificar el despliegue: Una vez completado el despliegue, deberías ver un enlace a tu aplicación desplegada.
Siguiendo estos pasos y utilizando el archivo vercel.json correctamente configurado, tu aplicación Flask debería desplegarse sin problemas en Vercel.
