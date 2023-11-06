# multi-step build process
# install dependencies and run build
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# FROM statement indicates new block
FROM nginx
# only copy over the build from builder step
COPY --from=builder /app/build /usr/share/nginx/html