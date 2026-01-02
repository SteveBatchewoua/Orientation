# Étape de Build
FROM node:20 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build -- --configuration production

# Étape de Serveur (Nginx)
FROM nginx:alpine
COPY --from=build /app/dist/estm-web/browser /usr/share/nginx/html
# Copier une config nginx personnalisée si nécessaire
EXPOSE 80