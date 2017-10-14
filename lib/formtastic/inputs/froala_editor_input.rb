module Formtastic
  module Inputs
    class FroalaEditorInput < Formtastic::Inputs::TextInput
      def input_html_options
        super.merge( class: 'froala-editor' )
      end
    end
  end
end
