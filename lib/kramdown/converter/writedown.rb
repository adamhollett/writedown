# frozen_string_literal: true

# TODO: - [x] Asides (note blocks)
#       - [x] Checkboxes
#             Give checkboxes IDs from the line number in the source document
#       - [x] Checkboxes pre-filled with Xs
#       - [x] Figures
#       - [ ] Video embeds

module Kramdown
  module Converter
    class Writedown < Html
      include ::Writedown::Image
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

      def convert_p(el, indent)
        if el.children.size == 1 && el.children.first.type == :img
          convert_figure(el, indent)
        elsif el.children.first.value =~ ::Writedown::Checkbox.pattern
          convert_checkbox(el, indent)
        else
          super
        end
      end
    end
  end
end
