require_relative 'lib/my_turbo/version'

Gem::Specification.new do |spec|
  spec.name        = 'my_turbo'
  spec.version     = MyTurbo::VERSION
  spec.authors     = ['Jonathan Novaretti']
  spec.email       = ['jonn.novaretti@gmail.com']
  spec.summary     = 'This gem is a study of the Turbo Framework'
  spec.description = 'This gem is a study of the Turbo Framework'
  spec.license     = 'MIT'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'rails', '>= 7.0.4'
end
