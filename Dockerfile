FROM elixir:1.5.2

RUN mix local.hex --force
RUN mix local.rebar --force

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update
RUN apt-get install -y build-essential netcat nodejs postgresql-client yarn

RUN curl -fSL -o /root/docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-17.09.0-ce.tgz
RUN cd /root && tar xzf docker.tgz
RUN cp /root/docker/* /usr/bin/
