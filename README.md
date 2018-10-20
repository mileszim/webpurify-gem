# WebPurify RubyGem #
[![Gem Version](https://badge.fury.io/rb/webpurify.svg)](https://badge.fury.io/rb/webpurify) [![Build Status](https://travis-ci.org/mileszim/webpurify.svg?branch=master)](https://travis-ci.org/mileszim/webpurify)

This gem allows simple interaction with the WebPurify API using Ruby. For more information about WebPurify and the services it offers, check out http://webpurify.com/.


### Commands

##### Text Filters
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

##### Image Filters
* [imgcheck](#imgcheck)
* [imgstatus](#imgstatus)
* [imgaccount](#imgaccount)


Install & Initialize
--------------------

`gem install webpurify`

or with bundler

`gem webpurify`

`bundle install`

Initialize with

```rb
@wp = WebPurify::Client.new('my_api_key')
```

or

```rb
@wp = WebPurify::Client.new({
  api_key:    'my_api_key',
  endpoint:   :us,    # can be :us, :eu, :ap (defaults to :us)
  enterprise: false,  # true for ssl (default false, enterprise key required)
})
```

Commands
--------

<a name="check" />
### check
Check a string of text for profanity. Returns true if profanity found, false if none.

```rb
puts @wp.check('some profane text')
```


<a name="check_count" />
### check_count
Check a string of text for profanity. Returns number of words if profanity found, 0 if none.

```rb
puts @wp.check_count('profane text')
```


<a name="replace" />
### replace
Check a string of text for profanity. Replaces any found profanity with a provided symbol, and returns the formatted string.

```rb
puts @wp.replace('profane text', '*')
```


<a name="return" />
### return
Check a string of text for profanity. If any found, returns an array of profane words. Else, returns empty array.

```rb
p @wp.return('profane text')
```


### Text Filter Options
All text filter commands can take an additional options object, just before the callback. The available options are:

```rb
options = {
  lang:   'en', # the 2 letter language code for the text you are submitting
  semail: 1,    # treat email addresses like profanity
  sphone: 1,    # treat phone numbers like profanity
  slink:  1     # treat urls like profanity
}

puts @wp.check('some profane text', options)
```


<a name="add_to_blacklist" />
### add_to_blacklist
Add a word to the blacklist.

```rb
@wp.add_to_blacklist('my_awesome_word')
```

For Deep search, add optional parameter 1 after word:

```rb
@wp.add_to_blacklist('my_awesome_word', 1)
```


<a name="remove_from_blacklist" />
### remove_from_blacklist
Remove a word from the blacklist.

```rb
@wp.remove_from_blacklist('my_awesome_word')
```


<a name="get_blacklist" />
### get_blacklist
Get the blacklist as an array of words.

```rb
p @wp.get_blacklist
```


<a name="add_to_whitelist" />
### add_to_whitelist
Add a word to the whitelist.

```rb
@wp.add_to_whitelist('my_awesome_word')
```


<a name="remove_from_whitelist" />
### remove_from_whitelist
Remove a word from the whitelist.

```rb
@wp.remove_from_whitelist('my_awesome_word')
```


<a name="get_whitelist" />
### get_whitelist
Get the whitelist as an array of words.

```rb
p @wp.get_whitelist
```


<a name="imgcheck" />
### imgcheck
Submit an image to the moderation service. Returns an image ID that is used to return the results of the moderation to a callback function.

```rb
puts @wp.imgcheck(imgurl)
```


### imgcheck Options
imgcheck can take an additional options object. The available options are:

```rb
options = {
  customimgid: 1   # Custom ID that will be associated with the image
  callback:    url # Callback URL that will receive a GET request once the image has been moderated
}

puts @wp.imgcheck(imgurl, options)
```


<a name="imgstatus" />
### imgstatus
Check the moderation status of an image. Returns one of the following strings: pending, approved, declined.

```rb
puts @wp.imgstatus(imgid)
```


### imgstatus Options
imgstatus can take an additional options object. The available options are:

```rb
options = {
  customimgid: 1 # Custom ID that is associated with the image
}

puts @wp.imgstatus(imgid, options)
```


<a name="imgaccount" />
### imgaccount
Check the number of image submissions remaining on your license. Returns an integer.

```rb
p @wp.imgaccount
```

## To-do:
* Handle error responses
* Tests
