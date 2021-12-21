FROM node:16-alpine as first

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build



#RUN PHASE

FROM nginx
COPY --from=first /app/build /usr/share/nginx/html
# Default command of nginx image is to start the nginx so nothing else needed