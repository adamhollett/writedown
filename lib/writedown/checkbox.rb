# frozen_string_literal: true

module Writedown
  module Checkbox
    CHECKBOX_PATTERN = /^\[([ xX]?)\] ?/

    def convert_checkbox(el, indent)
      text_content = el.children.first.value

      el.options[:transparent] = false
      box_contents = text_content.match(CHECKBOX_PATTERN)[1]
      text_content = text_content.sub(CHECKBOX_PATTERN, '')
      checked = 'checked' if box_contents =~ /[xX]/
      id = "checkbox-#{el.options[:location]}"

      el.children = []

      # Create the input element
      input_attrs = { type: 'checkbox', id: id, checked: checked }
      input_element = Kramdown::Element.new(
        :html_element, :input, input_attrs, category: :block, content_model: :raw, is_closed: true
      )

      # Create the label
      label_element = Kramdown::Element.new(:html_element, :label, { for: id }, category: :span, content_model: :span)
      label_element.children << Kramdown::Element.new(:text, text_content)

      el.children << input_element
      el.children << label_element

      format_as_indented_block_html(el.type, el.attr, inner(el, indent), indent)
    end
  end
end
