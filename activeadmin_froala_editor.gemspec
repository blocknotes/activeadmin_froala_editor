# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
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

  spec.required_ruby_version = '>= 3.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = 'https://github.com/blocknotes/activeadmin_froala_editor/blob/main/CHANGELOG.md'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files         = Dir['{app,lib}/**/*', 'LICENSE.txt', 'Rakefile', 'README.md']
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activeadmin', '>= 2.9.0'
end
