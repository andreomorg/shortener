This API aims to demonstrate the use of URL Shortener in Ruby on Rails.


## Install

    bundle install

## Run the app

    rails s

## Run the tests

    rspec

# REST API

## Get list of URL's

### Request

`GET /all_urls/`


## Create a new URL Shortener

### Request

`POST /original_to_short/`


## Get a original url from short url

### Request

`GET /short_to_original/:short_url`
