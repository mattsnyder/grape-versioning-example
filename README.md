# grape-versioning-example
This repo exists to be an example of grape versioning, because I experienced problem safter upgrading from version 0.9
to 0.11
https://github.com/intridea/grape/issues/968

Run the goliath api server with

```
bundle exec ruby server.rb
```

Then curl with these commands to test versioning:

```
curl -v -H Accept:application/vnd.mattsnyder.ping-v1+json "http://localhost:9000/api/ping"
curl -v -H Accept:application/vnd.mattsnyder.ping-v2+json "http://localhost:9000/api/ping"
```

Can also run specs with:

```
bundle exec rspec spec
```
