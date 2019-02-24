Notejam: Ruby on Rails
======================

Notejam application implemented using [Ruby on Rails](http://rubyonrails.org/) framework.

Ruby on Rails version: 4.2.11

Installation and launching
--------------------------

### Clone

Clone the repo:

``` {.sourceCode .bash}
$ git clone git@github.com:komarserjio/notejam.git YOUR_PROJECT_DIR/
```

### Install

Use [RVM](https://rvm.io/) or [rbenv](https://github.com/sstephenson/rbenv) for environment management.

Install dependencies:

``` {.sourceCode .bash}
$ cd YOUR_PROJECT_DIR/rubyonrails/notejam/
$ bundle install
```

Create database schema:

``` {.sourceCode .bash}
$ cd YOUR_PROJECT_DIR/rubyonrails/notejam/
$ rake db:migrate
```

### Launch

Start built-in web server:

``` {.sourceCode .bash}
$ cd YOUR_PROJECT_DIR/rubyonrails/notejam/
$ rails server
```

Go to <http://127.0.0.1:3000/> in your browser.

### Run tests

Start functional and unit tests:

``` {.sourceCode .bash}
$ cd YOUR_PROJECT_DIR/rubyonrails/notejam/
$ rake test
```

Contribution
------------

Do you have ruby/rails experience? Help the app to follow ruby and rails best practices.

Please send your pull requests in the `master` branch. Always prepend your commits with framework name:

``` {.sourceCode .bash}
Rubyonrails: Implemented sign in functionality
```

Read [contribution guide](https://github.com/komarserjio/notejam/blob/master/contribute.rst) for details.
