# Usa una imagen base oficial de Node.js
FROM node:18

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

# Establece el directorio de trabajo en el contenedor
WORKDIR /home/node/app

# Copia el package.json y package-lock.json
COPY package*.json ./

USER node

# Instala las dependencias de la aplicación
RUN npm install express

# Copia el resto del código fuente de la aplicación al contenedor
COPY --chown=node:node . .

# Expone el puerto en el que la aplicación se ejecutará
EXPOSE 3000

# Define el comando para ejecutar la aplicación
CMD [ "npm", "start" ]
