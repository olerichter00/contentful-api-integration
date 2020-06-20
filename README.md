# Contentful API integration

This is an example Contentful API integration with Ruby on Rails using the [Contentful Models Gem](https://github.com/contentful/contentful_model).

**Features:**

- Contentful API integration
- 100% test coverage
- 100% lighthouse score (Accessibility and SEO)
- Page title per recipe

## Run locally

Make sure Ruby is installed, then run `bundle install` to install the dependencies and provide environment variables through a `.env` file (see `.env.example`) or manually.

To run the application locally, run `rails s`.

When the app is running you can see an overview of all recipes at [http://localhost:3000](http://localhost:3000) or [http://localhost:3000/recipes](http://localhost:3000/recipes).

**Using Docker**

Alternatively you can use docker-compose by running `docker-compose up` (you might need to set RAILS_ENV=development in the `.env` file) which will run the application in a docker container or you can build and run a docker container manually with `docker build -t marley-spoon-recipes .` and `docker run --publish 3000:3000 --env-file=./.env marley-spoon-recipes`.

## Test

Run `rspec` to run the tests.

**Using Docker**

Alternatively you can use docker-compose to run the tests in a docker container with `docker-compose run -e "RAILS_ENV=test" web bundle exec rspec`.

### Test Coverage

Test coverage is generated with [Simplecov](https://github.com/colszowka/simplecov) after every test run and can be found in the folder `/coverage`.

## Linter

Run `rubocop` for static code analysis and formatting.

## Next Steps / Out of Scope

- **Pagination:** Depending on the length of the recipe list, pagination may be necessary. Most pagination gems won't work out of the box without active record though.
- **Caching:** Using updated_at in the cache key still calls the Contentful API. It should be possible to invalidate the cache via a webhook after updating content on Contentful.
- **Styling:** Styling is still pretty basic. Improvements to make the app more mobile friendly could be made (e.g. responsive images with srcset or webp images).
- **Markdown:** Depending on the specification and content in the recipe description, the markdown parser could be adjusted (e.g. embedding videos).
- **Localization:** Depending on the available locales for the content on contentful localization could be used for the queries.
