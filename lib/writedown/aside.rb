# frozen_string_literal: true

module Writedown
  module Aside
    ASIDE_PATTERN = /(#{Writedown.configuration.aside_headings.join('|')}):?\n/i

    def convert_aside(el, indent)
      el.type = :aside
      text_content = el.children.first.children.first.value

      # Determine the heading string used
      heading_text = text_content.match(ASIDE_PATTERN)[1]

      base_class    = Writedown.configuration.aside_base_class
      aside_classes = [base_class]
      heading_slug  = Writedown::Utils.slugify(heading_text)
      aside_classes << "#{base_class}--#{heading_slug}" unless heading_slug == base_class

      el.attr[:class] = aside_classes.join(' ')

      # Remove the note pattern from the body contents
      text_content.sub!(ASIDE_PATTERN, '')

      heading_element = Kramdown::Element.new(
        :header,
        nil,
        nil,
        level: Writedown.configuration.aside_heading_level,
        raw_text: heading_text
      )
      heading_element.children << Kramdown::Element.new(:text, heading_text.capitalize)

      el.children.unshift(heading_element)

      format_as_indented_block_html(el.type, el.attr, inner(el, indent), indent)
    end
  end
end
