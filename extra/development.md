## Development

### Dev setup

There are 2 ways to interact with this project:

1) Using Docker:

```sh
make up         # starts the dev services (optional env vars: RUBY / RAILS / ACTIVEADMIN)
make specs      # run the tests (after up)
make lint       # run the linters (after up)
make server     # run the server (after up)
make shell      # open a shell (after up)
make down       # cleanup (after up)

# Example using specific versions:
RUBY=3.2 RAILS=7.1 ACTIVEADMIN=3.2.0 make up
```

2) With a local setup:

```sh
# Dev setup (set the required envs):
source extra/dev_setup.sh
# Install dependencies:
bundle update
# Run server (or any command):
bin/rails s
# To try different versions of Rails/ActiveAdmin edit extra/dev_setup.sh
```

### Update the editor

- Download the editor packages: https://github.com/froala/wysiwyg-editor/releases/latest
- Unpack it somewhere: `tar xvfz *.tar.gz`
- Enter in the extracted folder: `cd wysiwyg-editor*`
- Copy the JS files: `cp -r css js /tmp/`
- Enter in the gem root path
- Copy the new editor assets:

```sh
# From activeadmin_froala_editor root folder, move or delete the current JS files:
mv app/assets/javascripts/activeadmin/froala_editor /tmp/old_js
# Move the previously copied JS files:
mv /tmp/js app/assets/javascripts/activeadmin/froala_editor
# Move or delete the current CSS files:
mv app/assets/stylesheets/activeadmin/froala_editor /tmp/old_css
# Move the previously copied CSS files:
mv /tmp/css app/assets/stylesheets/activeadmin/froala_editor
```

- Check the changes, most of them should be for updated files plus some new / removed file
- Update _package.json_ with the new Froala version
- Update the lock file: `npx yarn`
- Update the _version.rb_ with the new Froala version
