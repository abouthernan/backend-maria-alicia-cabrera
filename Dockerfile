FROM node:20-alpine

WORKDIR /app

# Copiar package files
COPY package*.json yarn.lock ./

# Instalar dependencias
RUN yarn install --frozen-lockfile

# Copiar código
COPY . .

# Build de Strapi
RUN yarn build

# Exponer puerto
EXPOSE 1337

# Iniciar Strapi
CMD ["yarn", "start"]