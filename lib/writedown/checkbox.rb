# frozen_string_literal: true

module Writedown
  module Checkbox
    def self.pattern
      /^\[([ #{Writedown.configuration.checkbox_checks.join}]?)\] ?/
    end

    def convert_checkbox(el, indent)
      text_content = el.children.first.value

      el.options[:transparent] = false
      box_contents = text_content.match(Writedown::Checkbox.pattern)[1]
      text_content = text_content.sub(Writedown::Checkbox.pattern, '')
      checked = true if box_contents =~ /[#{Writedown.configuration.checkbox_checks.join}]/
      sep = Writedown.configuration.checkbox_id_separator
      id = [Writedown.configuration.checkbox_base_id, el.options[:location]].join(sep)

      el.children = []

      # Create the input element
      input_attrs = { type: 'checkbox', id: id, checked: checked }
      input_element = Kramdown::Element.new(
        :html_element, 'input', input_attrs, category: :span, content_model: :raw, is_closed: true
      )

      # Create the label
      label_element = Kramdown::Element.new(:html_element, :label, { for: id }, category: :span, content_model: :span)
      label_element.children << Kramdown::Element.new(:text, text_content)

      el.children << input_element
      el.children << label_element

      format_as_block_html(el.type, el.attr, inner(el, indent), indent)
    end
  end
end
