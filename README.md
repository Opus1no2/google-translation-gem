Google Translation Client
=========================
 
This is a minimalistic API client for Google Translation API

Installation
------------

Installation is a piece of cake:

To get started, install composer in your project:

$ gem install google-translate-mini


Usage
-----

Using the Google Translation client is easy:

``` ruby

# Translate from one language to another
client = Translate.new('YOUR API KEY')
client.translate(:source => 'en', :target => 'de', :q => @eng)

# Discover available languages
client.discover()

# Detect a language
client.detect("If wishes were fishes we'd all cast nets")


```