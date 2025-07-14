# Teste Técnico – Vaga Suporte / Infra / DevOps
Candidato: Matheus de Lima Lessa

## 🐳 Containers e Orquestração

### 1. Crie um `Dockerfile` para uma aplicação Node.js simples.
  ```ymml
      # Usar imagem oficial do Node.js
FROM node:18-alpine

# Diretório de trabalho
WORKDIR /app

# Copiar package.json e package-lock.json para instalar dependências
COPY package*.json ./

# Instalar dependências
RUN npm install

# Copiar o restante do código
COPY . .

# Expor a porta que a aplicação usará
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["node", "index.js"]
  ```

### 2. Crie um `docker-compose.yml` com os seguintes serviços:

- Aplicação Node.js
- Banco de dados PostgreSQL
- Nginx atuando como reverse proxy para a aplicação

### 3. (Bônus) Explique como você faria o deploy dessa stack em um cluster Kubernetes.
