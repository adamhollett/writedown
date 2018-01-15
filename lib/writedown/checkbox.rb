# frozen_string_literal: true

module Writedown
  module Checkbox
    CHECKBOX_PATTERN = /\[([ xX]?)\] ?/

    def convert_checkbox(el, indent)
      box_contents = el.children.first.children.first.value.match(CHECKBOX_PATTERN)[1]
      text_content = el.children.first.children.first.value.sub(CHECKBOX_PATTERN, '')

      li_contents = el.children.first
      li_contents.options[:transparent] = false

      checked = 'checked' if box_contents =~ /[xX]/

      id = "checkbox-#{el.options[:location]}"

      li_contents.children = []

      # Create the input element
      input_element = Kramdown::Element.new(:html_element, :input, { type: 'checkbox', id: id, checked: checked }, category: :block, content_model: :raw, is_closed: true)

      # Create the label
      label_element = Kramdown::Element.new(:html_element, :label, { for: id }, category: :span, content_model: :span)
      label_element.children << Kramdown::Element.new(:text, text_content)

      li_contents.children << input_element
      li_contents.children << label_element

      format_as_indented_block_html(el.type, el.attr, inner(el, indent), indent)
    end
  end
end
