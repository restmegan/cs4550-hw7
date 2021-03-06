mix deps.get --only prod
mix compile

mix ecto.migrate

npm install --prefix ./assets
npm run deploy --prefix ./assets
mix phx.digest

mix release
