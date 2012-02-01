# encoding: UTF-8
class ZfbenExtend::String < String
  def self.to_html text, options={}
    options = {
      link: true,
      link_regexp: /[a-zA-Z]{3,}:\/\/\S+/,
      tag: true,
      tag_regexp: /&?#[a-zA-Z0-9]+/,
      tag_url: '/tags/',
      mail: true,
      mail_regexp: /[a-zA-Z0-9.-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9.]+/,
      user: true,
      user_regexp: /@[a-zA-Z0-9]+/,
      user_url: '/users/'
    }.merge(options)
    
    data = {}
    
    if options[:link]
      data[:link] = []
      text = text.gsub(options[:link_regexp]){ |link|
        data[:link].push('<a href="' + link + '">' + link + '</a>')
        'ZFBENLINK' + (data[:link].length - 1).to_s + 'ZFBENLINK'
      }
    end
    
    if options[:tag]
      data[:tag] = []
      text = text.gsub(options[:tag_regexp]){ |tag|
        if tag[0] != '&'
          data[:tag].push('<a href="' + options[:tag_url] + tag.gsub('#', '') + '">' + tag + '</a>')
          'ZFBENTAG' + (data[:tag].length - 1).to_s + 'ZFBENTAG'
        else
          tag
        end
      }
    end
    
    if options[:mail]
      data[:mail] = []
      text = text.gsub(options[:mail_regexp]){ |mail|
        data[:mail].push('<a href="mailto:' + mail + '">' + mail + '</a>')
        'ZFBENMAIL' + (data[:mail].length - 1).to_s + 'ZFBENMAIL'
      }
    end
    
    if options[:user]
      data[:user] = []
      text = text.gsub(options[:user_regexp]){ |user|
        data[:user].push('<a href="' + options[:user_url] + user.gsub('@', '') + '">' + user + '</a>')
        'ZFBENUSER' + (data[:user].length - 1).to_s + 'ZFBENUSER'
      }
    end
    
    [:link, :tag, :mail, :user].each do |name|
      if options[name]
        text = text.gsub(Regexp.new('ZFBEN' + name.to_s.upcase + '[0-9]+ZFBEN' + name.to_s.upcase)){ |t| data[name][t.match(/[0-9]+/)[0].to_i] }
      end
    end
    
    self.new text
  end
  
  def to_html options = {}
    self.class.to_html self, options
  end
  
  def self.to_cnbr text, options = {}
    options = {
      chars: /(。|！|？)/,
      br: '<br />'
    }.merge(options)

    self.new text.gsub(options[:chars]){ |char| char << options[:br] }
  end
  
  def to_cnbr options = {}
    self.class.to_cnbr self, options
  end
end
