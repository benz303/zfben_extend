# zfben_extend

A tool to extend ruby string.

[![Build Status](https://secure.travis-ci.org/benz303/zfben_extend.png)](http://travis-ci.org/benz303/zfben_extend)

## Install

  gem 'zfben_extend'

## Use

```ruby
  ZfbenExtend::String.to_html('text http://link #tag mail@mail.com @user text')
  #=> 'text <a href="http://link">http://link</a> <a href="/tags/tag">#tag</a> <a href="mailto:mail@mail.com">mail@mail.com</a> <a href="/users/user">@user</a> text'
```

See more at https://github.com/benz303/zfben_extend/blob/master/test/zfben_extend_test.rb
