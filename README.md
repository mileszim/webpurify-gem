WebPurify RubyGem
=================

This gem allows simple interaction with the WebPurify API using Ruby. For more information about WebPurify and the services it offers, check out http://webpurify.com/.


### Commands

##### Filters
* [check](#check)
* [check_count](#check_count)
* [replace](#replace)
* [return](#return)

##### Blacklist
* [add_to_blacklist](#add_to_blacklist)
* [remove_from_blacklist](#remove_from_blacklist)
* [get_blacklist](#get_blacklist)

##### Whitelist
* [add_to_whitelist](#add_to_whitelist)
* [remove_from_whitelist](#remove_from_whitelist)
* [get_whitelist](#get_whitelist)


Install & Initialize
--------------------

`gem install WebPurify`

or with bundler

`gem WebPurify`
`bundle install`

Initialize with

```rb
@webpurify = WebPurify::Client.new('my_api_key')
```


## To-do:
* Handle error responses
* Tests