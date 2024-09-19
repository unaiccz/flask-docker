FROM python:3.9-slim

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia el archivo requirements.txt en el directorio de trabajo
COPY requirements.txt .

# Instala las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copia el contenido del directorio actual en el directorio de trabajo del contenedor
COPY . .

# Expone el puerto en el que la aplicación correrá
EXPOSE 8080

# Comando para ejecutar la aplicación con Gunicorn
CMD ["python3", "app.py"]