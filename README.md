##Clipbox: An App to keep track of all you love and share it with the world.

Clipbox is a Ruby on Rails application. It's a place where users can share their bookmarks with the world! It's a simple as sending an email! It uses Devise for local and facebook authentication. It uses mailgun to handle incoming emails that take a hashtag from the subject line of the email, with a link from the body of the email, checks to see if a category with that name exists and if it does, it adds the link to it. If the category does not exist, it creates it and adds the link. It uses embedly's API to give a nice preview of the page. 
Clipbox is deployed to Heroku [Here](http://devtheory-clipbox.herokuapp.com)

Setup
---

**config/application.yml needs to have the following ENV variables:**

DEVISE_SECRET_KEY: 'your devise secret key here'

FACEBOOK_APP_ID: 'your facebook app id here'

FACEBOOK_APP_SECRET: 'your facebook app secret here'

PRODUCTION_FACEBOOK_APP_ID: 'your facebook production app id here'

PRODUCTION_FACEBOOK_APP_SECRET: 'your facebook production app secret here'

MAILGUN_SMTP_LOGIN: 'your mailgun smtp login here'

MAILGUN_SMTP_PASSWORD: 'your mailgun smtp password here'

