### Ejercicio 1 de contenedores

* Crear red para contenedores

    ```
    docker network create lemoncode-challenge
    ```
* Crear contenedor MongoDB (con volumen)

  - Se crea el contenedor con:

    ```
    docker run -d --name some-mongo \
        -p 27017:27017 \
        -v mongo-data:/data/db \
        -e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
        -e MONGO_INITDB_ROOT_PASSWORD=secret \
        --network lemoncode-challenge \
        mongo

    NOTA: Se expone el puerto para introducir los datos desde
          MongoDB Compass. Luego se puede quitar para que el 
          acceso sea sólo interno
    ```
  - Se insertan datos como se indica en el ejercicio.


* Crear fichero Dockerfile para la imagen de backend (.NET)

  - Se cambia lo siguiente en el fichero de configuración `appsettings.json`: 
  
    ```
    "ConnectionString": "mongodb://mongoadmin:secret@some-mongo:27017",
    ```

  - Se cambia también, en `Properties/launchSettings.json`: 
    ```
    "applicationUrl": "http://0.0.0.0:5000",
    ```

  - Se construye la imagen con:

    ```
    docker build . -t topics-api

    NOTA: Los parámetros modificados sería mejor cambiarlos mediante 
          variables de entorno.
    ```

  - Se crea el contenedor con:

    ```
    docker run -d --name topics-api \
        --network lemoncode-challenge \
        topics-api   # Se queda el puerto oculto en la red local
    ```

* Crear fichero Dockerfile para la imagen de frontend (Node.js)

  - Se construye la imagen con:

    ```
    docker build . -t frontend
    ```

  - Se crea el contenedor con:

    ```
    docker run -d --name frontend  \
        -p 8080:3000  \
        -e API_URI=http://topics-api:5000/api/topics \
        --network lemoncode-challenge \
        frontend
    ```

### Ejercicio 2 de contenedores

Se crea el fichero *docker-compose.yml* para que haga el *build* de las imágenes, aunque se podrían haber cogido las mismas imágenes creadas en el ejercicio anterior.

Al estar dentro del *docker-compose* se ha creado el volumen como `lemoncode-challenge_mongo-data` y, por lo tanto, hay que volver a introducir los datos para poder ver algo en la aplicación.

Acciones Para:
* Levantar el entorno: `docker-compose up` (añadir -d si no se quiere ver el log)
* Parar el entorno: `docker-compose stop`
* Eliminar el entorno: `docker-compose down -v` (se usa -v para eliminar también el volumen)
