# Teacher

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

### Teacher blog website part1
  * mix phoenix.new Teacher
  * mix ecto.create
  * mix phoenix.gen.html Post posts title:string body:text
  * update routes with resource for posts
  resources "/posts", PostController
  * mix ecto.migrate
  * mix phoenix.routes

### adding comment model

  * mix phoenix.gen.model Comment comments body:text post_id:references:posts

### deploying elixir to heroku

https://elixircasts.io/deploying-elixir-with-heroku

  * heroku create --buildpack "https://github.com/HashNuke/heroku-buildpack-elixir.git"
  * heroku buildpacks:add https://github.com/gjaldon/heroku-buildpack-phoenix-static.git
  * heroku addons:create heroku-postgresql:hobby-dev
  * heroku config:set POOL_SIZE=18
  * mix phoenix.gen.secret
  2cq/NBdRzqk4cEGstcPURl0R4WRS/LWJRa42/LThT26drLeMyO8eGV7/EBxrOvQS

  * heroku config:set SECRET_KEY_BASE="2cq/NBdRzqk4cEGstcPURl0R4WRS/LWJRa42/LThT26drLeMyO8eGV7/EBxrOvQS"

  * git push heroku master
