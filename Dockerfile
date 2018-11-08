FROM ruby:2.5

# lanzar errores si Gemfile ha sido modificado desde Gemfile.lock
RUN bundle config --global frozen 1
MAINTAINER Matilde Cabrera <mati331@correo.ugr.es>


COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# Comando predeterminado, ejecutando la aplicación como un servicio
CMD ["bundle", "rackup", "config.ru", "-p", "80", "-s","--host", "0.0.0.0"]
