# README

User can shorten a url by posting a url and a custom made slog to api/v1/link
this checks the link for formating and presence as well as length. The user is returned a link that they can add to a browser and be redirected to the original link they added. Validations on long links and slugs, can't be less then 3 characters or more then 255. Programmed notes, opted to add authentication, if I would I would have used JWT authentication using a token. Run bundle install and rspec for tests. User can delete old urls by reading in slug. To run, run rails server and use curl commands:


##Generate Shorted Url

curl -H "Content-Type: application/json" -H "Accept: application/json" -d '{"url": "https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres", "slug": "test"}' http://localhost:3000/api/v1/links