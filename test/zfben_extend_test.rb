class TestZfbenExtend < Test::Unit::TestCase
  def test_link
    assert_equal ZfbenExtend::String.to_html('http://link', link: false), 'http://link'
    assert_equal ZfbenExtend::String.to_html('http://link'), '<a href="http://link">http://link</a>'
    assert_equal ZfbenExtend::String.to_html('text http://link text'), 'text <a href="http://link">http://link</a> text'
    assert_equal ZfbenExtend::String.to_html('text http://link ftp://link/folder'), 'text <a href="http://link">http://link</a> <a href="ftp://link/folder">ftp://link/folder</a>'
  end

  def test_tag
    assert_equal ZfbenExtend::String.to_html('#a', tag: false), '#a'
    assert_equal ZfbenExtend::String.to_html('#a'), '<a href="/tags/a">#a</a>'
    assert_equal ZfbenExtend::String.to_html('text #a #b'), 'text <a href="/tags/a">#a</a> <a href="/tags/b">#b</a>'
  end
  
  def test_mail
    assert_equal ZfbenExtend::String.to_html('abc@abc.com', mail: false, user: false), 'abc@abc.com'
    assert_equal ZfbenExtend::String.to_html('abc@abc.com'), '<a href="mailto:abc@abc.com">abc@abc.com</a>'
    assert_equal ZfbenExtend::String.to_html('text abc@abc.com zhu.feng@zfben.com'), 'text <a href="mailto:abc@abc.com">abc@abc.com</a> <a href="mailto:zhu.feng@zfben.com">zhu.feng@zfben.com</a>'
  end
  
  def test_user
    assert_equal ZfbenExtend::String.to_html('@user', user: false), '@user'
    assert_equal ZfbenExtend::String.to_html('@user'), '<a href="/users/user">@user</a>'
  end

  def test_all
    assert_equal ZfbenExtend::String.to_html('text http://link #tag mail@mail.com @user text', link: false, tag: false, mail: false, user: false), 'text http://link #tag mail@mail.com @user text'
    assert_equal ZfbenExtend::String.to_html('text http://link #tag mail@mail.com @user text', tag_url: '/tagurl/', user_url: '/userurl/'), 'text <a href="http://link">http://link</a> <a href="/tagurl/tag">#tag</a> <a href="mailto:mail@mail.com">mail@mail.com</a> <a href="/userurl/user">@user</a> text'
  end
end
