# Contact TestApp

This is simple contact details web application and API with Ruby on rails.

By using this application person can create them contact details.

Used Rspec gem for testing this application.


# Release Note

Ruby : 2.7.1

Rails : 6.1.0

Database: Postgres


# Follow below steps to setup your development environment

Step 1 : take a clone for this repository

```bash
https://github.com/VivekDabhi/contact-testapp
```

Step 2 : Go to the project directory

```bash
cd contact-testapp
```

Step 3: Install requires RVM for ruby 2.7.1

Step 4: Rename sample_databse.yml to database.yml and put your database credentials

Step 5: Do bundle install

Step 6: Create a database and run migrations

```bash
rails db:create
rails db:migrate
```

Step 10: Run Rails Server


```bash
rails s
```

# API Documentation

```bash
https://drive.google.com/file/d/1FNgad6eesNo9EmeCMcdb4_MQ2ArBS0Bq/view?usp=sharing
```

# Run Test Cases

```bash
bundle exec rails db:migrate -e test

bundle exec rspec
```

# Generate Coverage folder

After running your tests, open coverage/index.html in the browser of your choice. For example, in a Mac Terminal, run the following command from your application's root directory:

```bash
open coverage/index.html
```

in a debian/ubuntu Terminal,

```bash
xdg-open coverage/index.html
```