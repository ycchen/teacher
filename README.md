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

deploy source code to heroku server
  * git push heroku master

run ecto.migrate to create tables
  * heroku run "POOL_SIZE=2" mix ecto.migrate"

once the ecto.migrate is done then we can open our app on heroku

URL: https://calm-brushlands-14022.herokuapp.com/
DATABASE_URL: postgresql-parallel-52093


### add movie model with pagination using scrivener
https://elixircasts.io/elixir-pagination-with-scrivener

  * mix phoenix.gen.html Movie movies title:string summary:text year:string

  * Modified priv/repo/seeds.exs to pre-populated movies table

  * mix run priv/repo/seeds.exs

  * Added :scrivener_html and :scrivener_ecto packages to mix.exs

  * Modified config.exs to add :scrivener_html routes

  * mix deps.get

  Replaced
  <%= if @page.page_number > 1 do %>
    <%= link "Prev Page", to: movie_path(@conn, :index, page: @page.page_number-1) %>
  <% end %>
  |
  <%= if @page.page_number < @page.total_pages do %>
    <%= link "Next Page", to: movie_path(@conn, :index, page: @page.page_number + 1) %>
  <% end %>

 with
 <%= pagination_links @page%>

* scrivener_ecto : https://github.com/drewolson/scrivener_ecto
* scrivener_html : https://github.com/mgwidmann/scrivener_html
