# FROM node:18

# WORKDIR /app

# COPY package*.json ./

# RUN npm install

# COPY . .

# RUN npm run build

# CMD [ "npm", "run", "start:dev" ]

FROM node:18 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build


####################
FROM node:18-alpine

WORKDIR /app

COPY --from=build /app /app

EXPOSE 3000

CMD [ "npm", "run", "start:prod" ]
