# blog.ktd-web.com

## install
make dir, file

### /.bowerc
  {
    "directory": "vendor"
  }

### /.bower.json
  {
    "name": "anagift",
    "version": "0.0.1",
    "igonre": [
    ],
    "dependencies": {
      "bootstrap-sass-official": null
    },
    "devDependensies": {
    }
  }

### mkdir
* /jedie
* /jedie/sass
* /vendor

### bower
bower install

### jedie
jedie new jedie

## make styles.css
1. jedie/sass/styles.sass
2. write `@import '../../vendor/bootstrap-sass-official/assets/stylesheets/_bootstrap.css'`
3. sass jedie/sass/styles.sass:jedie/css/styles.css

## customize html
1. include styles.css to _layouts/default.html

 
