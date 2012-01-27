# zfben_extend

A tool to extend ruby string.

[![Build Status](https://secure.travis-ci.org/benz303/zfben_extend.png)](http://travis-ci.org/benz303/zfben_extend)

## Install

  gem 'zfben_extend'

## Use

```ruby
  ZfbenExtend::String.to_html('text http://link #tag mail@mail.com @user text', tag_url: '/tagurl/', user_url: '/userurl/')
  
  # => 'text <a href="http://link">http://link</a> <a href="/tagurl/tag">#tag</a> <a href="mailto:mail@mail.com">mail@mail.com</a> <a href="/userurl/user">@user</a> text'
  
  ZfbenExtend::String.to_cnbr('a.b', chars: /\./, br: '<hr />')
  # => 'a.<hr />b'
```

See more at https://github.com/benz303/zfben_extend/blob/master/test/string_test.rb
