A restaurant app with admin facing CRUD controls for products. Built with Rails and Bootstrap. 

**Setup** - 
  * Made a new Rails application with 
    * ```bash
      rails new restaurant
      ```
  * Add some gems
    * ```bash
      echo "gem 'activeadmin' >> Gemfile"
      echo "gem 'bootstrap' >> Gemfile"
      echo "gem 'aws-sdk-s3', require: false >> Gemfile"
      ```
    * Uncomment `gem 'redis', '~> 4.0'` for use in production later
  * Add bootstrap, popper.js, and jquery with yarn
    * ```bash
      yarn add bootstrap popper.js jquery
      ```
  * Generate scaffold for products
    * ```bash
      rails g scaffold products name:string description:text price:float
      ```
  * Run bundle
    * `bundle install`
  * Generate ActiveAdmin installation. I am using Rails 6.0.3.2, so the `--use_webpacker` flag is necessary
    * ```bash
      rails g active_admin:install --use_webpacker --skip-users
      ```
  * Add Product model to ActiveAdmin resources
    * ```bash
      rails g active_admin:resource product
      ```
  * Migrate DB
    * `rails db:migrate`
  * Uncomment permitted params in app/admin/products.rb