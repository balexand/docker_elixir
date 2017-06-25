FROM ubuntu:16.04

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl language-pack-en locales
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

RUN curl -O https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

ENV APT_ERLANG_VERSION=1:20.0
ENV APT_ELIXIR_VERSION=1.4.5-1
ENV APT_NODE_VERSION=8.1.2-1nodesource1~xenial1

RUN apt-get update
RUN apt-get install -y build-essential postgresql-client libodbc1 libsctp1 libwxgtk3.0-0v5
RUN apt-get install -y nodejs=$APT_NODE_VERSION
RUN apt-get install -y esl-erlang=$APT_ERLANG_VERSION
RUN apt-get install -y elixir=$APT_ELIXIR_VERSION

RUN mix local.hex --force
RUN mix local.rebar --force
