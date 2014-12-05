# Modular angular skeleton

#### Angular skeleton app with sass, coffee in a modular way

## Demo
    
[http://nhim175.github.io/]()

## Installation

- git clone https://github.com/nhim175/modular-angular-skeleton.git
- cd modular-angular-skeleton
- gulp clean-build && gulp
- cd module-angular-skeleton/build && python -m SimpleHTTPServer 3000
- Open http://localhost:3000 on your browser

## Structure
    src
    |-- app.coffee
    |-- components
    |   |-- admin
    |   |-- home
    |   |   |-- HomeController.coffee
    |   |   |-- home.html
    |   |   `-- home.scss
    |   |-- login
    |   |-- post
    |   |   |-- PostController.coffee
    |   |   |-- post.admin.html
    |   |   |-- post.grid.html
    |   |   |-- post.new.html
    |   |   |-- post.scss
    |   |   `-- post.single.html
    |-- directives
    |   |-- markdown.coffee
    |   `-- moment.coffee
    |-- index.html
    `-- services
        |-- Post.coffee
        `-- User.coffee

## Demo source code
[https://github.com/nhim175/modular-angular-skeleton-demo]()