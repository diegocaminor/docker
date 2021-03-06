FROM node:lts

# copio los archivos que son usados por "npm install"
COPY ["package.json", "package-lock.json", "/usr/src/"]
# es similar al comando cd, WORKDIR <entrar en la siguiente ruta>
WORKDIR /usr/src
# RUN ejecuta el comando npm install
RUN npm install
# [<ubicacion de los archivos a copiar>, <destino donde van a quedar los archivos copiados>]
COPY [".", "/usr/src/"]
# le indica al contenedor el puerto por el cual va a salir o exponer el contenedor, es el mismo puerto por donde esta escuchando node
EXPOSE 3000
# ejecuta el comando node index.js el cual levanta el servidor de express
CMD ["npx", "nodemon", "index.js"]