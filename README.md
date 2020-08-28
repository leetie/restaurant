A restaurant app with admin facing CRUD controls for products. Built with Rails and Bootstrap. 

**Setup** - 
  * Make a new Rails application with 
    * ```bash
      rails new restaurant
      ```
  * Add some gems
    * ```bash
      echo "gem 'activeadmin' >> Gemfile"
      echo "gem 'bootstrap' >> Gemfile"
      echo "gem 'aws-sdk-s3', require: false >> Gemfile"
      ```
    * Uncomment `gem 'redis', '~> 4.0'` for use in production later, as well as `gem 'image_processing'`
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
  * Add picture attachment to product.rb file
    * `has_one_attached :picture, dependent: :destroy`
  * Generate ActiveStorage Installation
    * ```bash
      rails active_storage:install
      ```
  * Migrate DB
    * `rails db:migrate`
  * Uncomment permitted params in app/admin/products.rb
  * Add to config/environment.js
    * ```javascript
        environment.plugins.append(
          "Provide",
          new webpack.ProvidePlugin({
            $: "jquery",
            jQuery: "jquery",
            Popper: ["popper.js", "default"]
          })
        )
      ```
  * Rename app/assets/stylesheets/application.css to application.scss
  * Insert ` *= require bootstrap ` into application.scss above `*=require_tree . `
  * Done! Bootstrap added, ActiveStorage added for development environment, and ActiveAdmin added.