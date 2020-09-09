# frozen_string_literal: true

module Formtastic
  module Inputs
    class FroalaEditorInput < Formtastic::Inputs::TextInput
      def input_html_options
        super.merge('data-aa-froala-editor': '1')
      end
    end
  end
end
