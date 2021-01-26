FROM node:lts-buster as nodebuild
WORKDIR /build/
COPY . /build/
RUN yarn
RUN yarn build

FROM nginx:alpine
COPY --from=nodebuild /build/dist/ /usr/share/nginx/html/