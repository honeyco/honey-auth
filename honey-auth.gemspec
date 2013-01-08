Gem::Specification.new do |s|
  s.name        = 'honey-auth'
  s.version     = '0.1.0'
  s.date        = '2012-10-16'
  s.summary     = 'Auth'
  s.description = 'Very basic auth generator'
  s.authors     = ['Quinn Shanahan']
  s.email       = 'q.shanahan@gmail.com'
  s.files       = Dir.glob('{vendor,lib,app}/**/*')
  s.homepage    = 'https://github.com/honeyco/honey-auth'

  s.add_runtime_dependency 'haml', '>= 0'
  s.add_runtime_dependency 'bcrypt-ruby', '>= 0'
end
