# auction site

This project was a refresher to get back into ruby on rails

The aim is to create a CRUD system that has items and users can place bids on those options.

There also is a toggle to have the item up for auction to be a blind auction or not.

## setup

Install asdf and the correct ruby version:

### asdf

These projects are managed with asdf. Follow their installation guide: [https://asdf-vm.com/guide/getting-started.html](https://asdf-vm.com/guide/getting-started.html) first.

### install ruby version

Version set with local [.tool-versions](./.tool-versions) file. Projects are likely to have different Ruby versions. Check project README.md for more information.

```sh
asdf install
```

## database

set up the database with

```sh
rake db:create
rake db:migrate
```

## run it

```sh
rails server
```

and navigate to the address in the terminal.
