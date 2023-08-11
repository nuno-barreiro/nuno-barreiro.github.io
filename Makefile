setup:
	asdf install
	gem install bundler jekyll
	bundle install

build:
	bundle exec jekyll build

serve:
	bundle exec jekyll serve --drafts

clean:
	bundle exec jekyll clean
