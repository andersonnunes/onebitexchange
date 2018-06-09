FROM ruby:2.5.1-alpine3.7

RUN apk --update add --virtual\
  build-dependencies build-base libev libev-dev postgresql-dev nodejs bash tzdata yarn

# Seta nosso path
ENV INSTALL_PATH /onebitexchange

# Cria nosso diretório
RUN mkdir -p $INSTALL_PATH

# Seta o nosso path como o diretório principal
WORKDIR $INSTALL_PATH

# Copia o nosso Gemfile para dentro do container
COPY Gemfile ./

# Seta o path para as Gems
ENV BUNDLE_PATH /gems

# Copia nosso código para dentro do container
COPY . .