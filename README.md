# What's this

A docker container which allows you to use Guild on Ruby easily.
It is built from https://github.com/ko1/ruby/tree/guild.

# Requirements

- Docker

# Usage

You need just run a container to use.
Then an iex will start.

```
$ docker run -it --rm --name my-guild niku/ruby-guild
irb(main):001:0> g1 = Guild.new do
irb(main):002:1*   receive = Guild.receive
irb(main):003:1>   Guild.parent << receive
irb(main):004:1> end
=> #<Guild:0x0000559cc1e87430>
irb(main):005:0> g1 << "hello"
=> nil
irb(main):006:0> p Guild.receive
"hello"
=> "hello"
```

# Link

- Dockerhub https://hub.docker.com/r/niku/ruby-guild/
- Dockefile is based on official ruby's one https://github.com/docker-library/ruby/blob/57801cf4e9a2506e9c66380ab9e3ff9f63a669a7/2.6-rc/stretch/Dockerfile
- The creater of Guild, ko1's slide at RubyKaigi2018 is http://www.atdot.net/~ko1/activities/2018_rubykaigi2018.pdf

# LICENCE

MIT
