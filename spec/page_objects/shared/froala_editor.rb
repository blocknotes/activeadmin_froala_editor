# frozen_string_literal: true

module Shared
  class FroalaEditor < HtmlEditor
    attr_reader :editor_selector

    def initialize(container)
      @editor_selector = "#{container} .fr-box"
      super(selector: editor_selector)
    end

    def content = content_element['innerHTML']

    def content_element
      @content_element ||= find("#{editor_selector} [contenteditable]")
    end

    def toggle_bold = find("#{editor_selector} [data-cmd='bold']").click

    def toggle_italic = find("#{editor_selector} [data-cmd='italic']").click

    def toggle_underline = find("#{editor_selector} [data-cmd='underline']").click

    def toggle_align_left = find("#{editor_selector} [data-cmd='alignLeft']").click

    def toggle_align_center = find("#{editor_selector} [data-cmd='alignCenter']").click

    def toggle_ordered_list = find("#{editor_selector} [data-cmd='formatOLSimple']").click

    def toggle_link = find("#{editor_selector} [data-cmd='insertLink']").click
  end
end
