FROM node:14-alpine AS client_build

WORKDIR /app
COPY ./client /app/

RUN npm install
RUN node_modules/.bin/ng build --configuration production

#build backend

FROM node:14-alpine AS server_build
WORKDIR /app

COPY ./server /app
COPY --from=client_build /app/dist/client /app/dist/client

RUN npm install --production
# build docker
FROM alpine 
WORKDIR /app
RUN apk add --no-cache nodejs
COPY --from=server_build /app ./

EXPOSE 3006

CMD ["node","server"]

# some changes to soee

