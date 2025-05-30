FROM  --platform=linux/amd64 node:18 AS build

WORKDIR /app

ENV VITE_API_URL=https://api.demo.lebondeveloppeur.net

COPY package*.json ./

RUN npm install  --force

COPY . .

RUN npm run build



FROM  --platform=linux/amd64 nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

