FROM node:20-alpine

WORKDIR /app

# Copiar package files
COPY package.json yarn.lock ./

# Instalar dependencias
RUN yarn install --frozen-lockfile

# Copiar el resto del código
COPY . .

# Build de Strapi
ENV NODE_ENV=production
RUN yarn build

# Exponer el puerto de Strapi
EXPOSE 1337

# Iniciar Strapi
CMD ["yarn", "start"]
```

5. **Commit changes** con el mensaje: "Add Dockerfile for deployment"

---

### **Paso 2: Crea también un `.dockerignore`**

Para optimizar el build, crea otro archivo:

1. **"Add file" → "Create new file"**

2. **Nombre:** `.dockerignore`

3. **Contenido:**
```
node_modules
.tmp
.cache
build
.git
.env
*.log
.DS_Store
```

4. **Commit changes**

---

### **Paso 3: Vuelve a Easy Panel y haz Rebuild**

1. **En Easy Panel, ve a "Deployments"** (en el menú lateral)

2. **Click en el botón de "Rebuild"** (el ícono de refresh/reload arriba)

3. **O simplemente ve a "Source" y click en "Save" de nuevo**

4. **Espera a que termine el build**

---

### **Paso 4: Revisa los logs del build**

1. **En Easy Panel, click en "Deployments"**

2. **Verás el progreso del build en tiempo real**

3. **Si hay errores, los verás ahí**

---

## **Si usas una base de datos, también necesitas configurarla:**

### **Paso 5: Configura las variables de entorno**

1. **En Easy Panel, ve a "Environment"** (en el menú lateral)

2. **Agrega estas variables:**
```
NODE_ENV=production
HOST=0.0.0.0
PORT=1337
APP_KEYS=[genera una clave aleatoria]
API_TOKEN_SALT=[genera una clave aleatoria]
ADMIN_JWT_SECRET=[genera una clave aleatoria]
TRANSFER_TOKEN_SALT=[genera una clave aleatoria]
JWT_SECRET=[genera una clave aleatoria]

# Si usas SQLite (por defecto en Strapi)
DATABASE_CLIENT=sqlite
DATABASE_FILENAME=.tmp/data.db

# O si usas PostgreSQL/MySQL, configura esas variables
