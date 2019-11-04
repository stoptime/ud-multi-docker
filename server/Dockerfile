FROM node:alpine
WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY . .
# the start command is defined in package.json
CMD ["npm", "run", "start"]
