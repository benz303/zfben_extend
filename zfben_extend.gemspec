# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'zfben_extend'
  s.version     = '0.0.5'
  s.authors     = ['Ben']
  s.email       = ['ben@zfben.com']
  s.homepage    = 'https://github.com/benz303/zfben_extend'
  s.summary     = %q{}
  s.description = %q{}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
  
  s.add_dependency 'redcarpet'
  s.add_dependency 'coderay'
  s.add_dependency 'activesupport'
end
