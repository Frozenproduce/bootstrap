= Bootstrap

Set up:

- Modify Gemfile 

```ruby
gem 'bootstrap', github: 'Frozenproduce/bootstrap'
gem 'simple-navigation-bootstrap'
gem 'less-rails'
gem 'therubyracer'
```

- bundle

- rake bootstrap_engine:install:migrations

- bubdle exec rake db:migrate

- Update app/assets/javascript/application.js

```ruby
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .
```

- Update app/assets/stylesheets/application.css

```ruby
 *= require_self
 *= require bootstrap
 *= require_tree .
```ruby

- rails s puma

- /users/sign-up and create user

- rails console

```ruby
u = User.first
u.active = true
u.add_roles :admin
u.save!
```

This project rocks and uses MIT-LICENSE.
