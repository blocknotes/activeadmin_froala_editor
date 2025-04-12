# frozen_string_literal: true

class BasePage
  include Capybara::DSL

  attr_reader :path

  def initialize(path:)
    @path = path
  end

  def load = visit(path)

  def lookup_editor(editor_container:)
    @editor = FroalaEditor.new(editor_container)
  end
end
