lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activeadmin/froala_editor/version'

Gem::Specification.new do |spec|
  spec.name          = 'activeadmin_froala_editor'
  spec.version       = ActiveAdmin::FroalaEditor::VERSION
  spec.summary       = 'Froala editor for ActiveAdmin'
  spec.description   = 'An Active Admin plugin to use Froala WYSIWYG editor'
  spec.license       = 'MIT'
  spec.authors       = ['Mattia Roccoberton']
  spec.email         = 'mat@blocknot.es'
  spec.homepage      = 'https://github.com/blocknotes/activeadmin_froala_editor'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activeadmin', '~> 1.0'
end
