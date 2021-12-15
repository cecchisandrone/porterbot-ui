FROM node:10.15.0 as builder
ADD . /build
WORKDIR /build
RUN npm install
RUN npm run build
FROM arm32v7/nginx:1.21.4-alpine
COPY --from=builder /build/dist /usr/share/nginx/html/dist
ADD nginx/default /etc/nginx/conf.d/default.conf
ADD index.html /usr/share/nginx/html/