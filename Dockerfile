FROM alpine/git
COPY . /data
WORKDIR /data
# RUN rm -rf themes/*
# RUN git clone https://github.com/nanxiaobei/hugo-paper.git themes/hugo-paper
FROM klakegg/hugo:latest
COPY --from=0 /data /data
WORKDIR /data
RUN hugo --gc --minify

##

FROM mysocialobservations/docker-tdewolff-minify
COPY --from=1 /data/public /data/public
WORKDIR /data
RUN minify --recursive --verbose \
        --match=\.*.js$ \
        --type=js \
        --output public/ \
        public/

RUN minify --recursive --verbose \
        --match=\.*.css$ \
        --type=css \
        --output public/ \
        public/

RUN minify --recursive --verbose \
        --match=\.*.html$ \
        --type=html \
        --output public/ \
        public/

##

FROM nginx:alpine
COPY --from=2 /data/public /usr/share/nginx/html

# docker container run --rm -it -p 8080:80 hugo-blog
