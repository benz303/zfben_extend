# encoding: UTF-8
class TestStringBase < Test::Unit::TestCase
  def test_class
    assert_equal ZfbenExtend::String.new.class.to_s, 'ZfbenExtend::String'
    assert_equal ZfbenExtend::String.to_html('').class.to_s, 'ZfbenExtend::String'
    assert_equal ZfbenExtend::String.to_cnbr('').class.to_s, 'ZfbenExtend::String'
    assert_equal ZfbenExtend::String.new.to_html.class.to_s, 'ZfbenExtend::String'
    assert_equal ZfbenExtend::String.new.to_cnbr.class.to_s, 'ZfbenExtend::String'
    
    assert_equal ZfbenExtend::String.new.to_s.class.to_s, 'String'
  end
end

class TestToHtml < Test::Unit::TestCase
  def test_link
    assert_equal ZfbenExtend::String.to_html('http://link', link: false), 'http://link'
    assert_equal ZfbenExtend::String.to_html('http://link'), '<a href="http://link">http://link</a>'
    assert_equal ZfbenExtend::String.to_html('text http://link text'), 'text <a href="http://link">http://link</a> text'
    assert_equal ZfbenExtend::String.to_html('text http://link ftp://link/folder'), 'text <a href="http://link">http://link</a> <a href="ftp://link/folder">ftp://link/folder</a>'
    
    assert_equal ZfbenExtend::String.new('http://link').to_html(link: false), 'http://link'
    assert_equal ZfbenExtend::String.new('http://link').to_html, '<a href="http://link">http://link</a>'
    assert_equal ZfbenExtend::String.new('text http://link text').to_html, 'text <a href="http://link">http://link</a> text'
    assert_equal ZfbenExtend::String.new('text http://link ftp://link/folder').to_html, 'text <a href="http://link">http://link</a> <a href="ftp://link/folder">ftp://link/folder</a>'
  end

  def test_tag
    assert_equal ZfbenExtend::String.to_html('#a', tag: false), '#a'
    assert_equal ZfbenExtend::String.to_html('#a'), '<a href="/tags/a">#a</a>'
    assert_equal ZfbenExtend::String.to_html('text #a #b'), 'text <a href="/tags/a">#a</a> <a href="/tags/b">#b</a>'
    assert_equal ZfbenExtend::String.to_html('&#39;s'), '&#39;s'
    
    assert_equal ZfbenExtend::String.new('#a').to_html(tag: false), '#a'
    assert_equal ZfbenExtend::String.new('#a').to_html, '<a href="/tags/a">#a</a>'
    assert_equal ZfbenExtend::String.new('text #a #b').to_html, 'text <a href="/tags/a">#a</a> <a href="/tags/b">#b</a>'
    assert_equal ZfbenExtend::String.new('&#39;s').to_html, '&#39;s'
  end
  
  def test_mail
    assert_equal ZfbenExtend::String.to_html('abc@abc.com', mail: false, user: false), 'abc@abc.com'
    assert_equal ZfbenExtend::String.to_html('abc@abc.com'), '<a href="mailto:abc@abc.com">abc@abc.com</a>'
    assert_equal ZfbenExtend::String.to_html('text abc@abc.com zhu.feng@zfben.com'), 'text <a href="mailto:abc@abc.com">abc@abc.com</a> <a href="mailto:zhu.feng@zfben.com">zhu.feng@zfben.com</a>'
    
    assert_equal ZfbenExtend::String.new('abc@abc.com').to_html(mail: false, user: false), 'abc@abc.com'
    assert_equal ZfbenExtend::String.new('abc@abc.com').to_html, '<a href="mailto:abc@abc.com">abc@abc.com</a>'
    assert_equal ZfbenExtend::String.new('text abc@abc.com zhu.feng@zfben.com').to_html, 'text <a href="mailto:abc@abc.com">abc@abc.com</a> <a href="mailto:zhu.feng@zfben.com">zhu.feng@zfben.com</a>'
  end
  
  def test_user
    assert_equal ZfbenExtend::String.to_html('@user', user: false), '@user'
    assert_equal ZfbenExtend::String.to_html('@user'), '<a href="/users/user">@user</a>'
    
    assert_equal ZfbenExtend::String.new('@user').to_html(user: false), '@user'
    assert_equal ZfbenExtend::String.new('@user').to_html, '<a href="/users/user">@user</a>'
  end

  def test_all
    assert_equal ZfbenExtend::String.to_html('text http://link #tag mail@mail.com @user text', link: false, tag: false, mail: false, user: false), 'text http://link #tag mail@mail.com @user text'
    assert_equal ZfbenExtend::String.to_html('text http://link #tag mail@mail.com @user text', tag_url: '/tagurl/', user_url: '/userurl/'), 'text <a href="http://link">http://link</a> <a href="/tagurl/tag">#tag</a> <a href="mailto:mail@mail.com">mail@mail.com</a> <a href="/userurl/user">@user</a> text'
    
    assert_equal ZfbenExtend::String.new('text http://link #tag mail@mail.com @user text').to_html(link: false, tag: false, mail: false, user: false), 'text http://link #tag mail@mail.com @user text'
    assert_equal ZfbenExtend::String.new('text http://link #tag mail@mail.com @user text').to_html(tag_url: '/tagurl/', user_url: '/userurl/'), 'text <a href="http://link">http://link</a> <a href="/tagurl/tag">#tag</a> <a href="mailto:mail@mail.com">mail@mail.com</a> <a href="/userurl/user">@user</a> text'
  end
end

class TestToCnBr < Test::Unit::TestCase
  def test_base
    assert_equal ZfbenExtend::String.to_cnbr('a。b'), 'a。<br />b'
    assert_equal ZfbenExtend::String.to_cnbr('a。b！c？'), 'a。<br />b！<br />c？<br />'
    
    assert_equal ZfbenExtend::String.new('a。b').to_cnbr, 'a。<br />b'
    assert_equal ZfbenExtend::String.new('a。b！c？').to_cnbr, 'a。<br />b！<br />c？<br />'
  end
  
  def test_options
    assert_equal ZfbenExtend::String.to_cnbr('a.b', chars: /\./), 'a.<br />b'
    assert_equal ZfbenExtend::String.to_cnbr('a。b', br: '<hr />'), 'a。<hr />b'
    assert_equal ZfbenExtend::String.to_cnbr('a.b', chars: /\./, br: '<hr />'), 'a.<hr />b'
    
    assert_equal ZfbenExtend::String.new('a.b').to_cnbr(chars: /\./), 'a.<br />b'
    assert_equal ZfbenExtend::String.new('a。b').to_cnbr(br: '<hr />'), 'a。<hr />b'
    assert_equal ZfbenExtend::String.new('a.b').to_cnbr(chars: /\./, br: '<hr />'), 'a.<hr />b'
  end
end
