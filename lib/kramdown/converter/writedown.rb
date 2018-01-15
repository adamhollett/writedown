# frozen_string_literal: true

# TODO: - [x] Asides (note blocks)
#       - [x] Checkboxes
#             Give checkboxes IDs from the line number in the source document
#       - [x] Checkboxes pre-filled with Xs
#       - [ ] Figures
#       - [ ] Video embeds
#       - [ ] External links

require 'byebug'

module Kramdown
  module Converter
    class Writedown < Html
      include ::Writedown::Aside
      include ::Writedown::Checkbox
      include ::Writedown::Figure

      def convert_blockquote(el, indent)
        if el.children.first.children.first.value =~ ASIDE_PATTERN
          convert_aside(el, indent)
        else
          super
        end
      end

      def convert_li(el, indent)
        if el.children.first.children.first.value =~ CHECKBOX_PATTERN
          convert_checkbox(el, indent)
        else
          super
        end
      end
    end
  end
end
