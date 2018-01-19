# frozen_string_literal: true

module Writedown
  module Aside
    ASIDE_PATTERN = /(#{Writedown.configuration.aside_headings.join('|')}):?\n/i

    def convert_aside(el, indent)
      text_content = el.children.first.children.first.value
      # Determine the heading string used
      heading_text = text_content.match(ASIDE_PATTERN)[1]
      # Remove the heading string from the contents
      text_content.sub!(ASIDE_PATTERN, '')

      # Create CSS classes
      base_class = Writedown.configuration.aside_base_class
      aside_classes = [base_class]
      heading_slug  = Writedown::Utils.slugify(heading_text)
      aside_classes << "#{base_class}--#{heading_slug}" unless heading_slug == base_class

      # Create the container element
      aside = Kramdown::Element.new(
        :html_element, :aside, { class: aside_classes.join(' ') }.merge(el.attr),
        category: :block, content_model: :block
      )

      # Insert a heading if they're enabled
      if Writedown.configuration.aside_show_headings
        heading = Kramdown::Element.new(
          :header, nil, nil,
          level: Writedown.configuration.aside_heading_level, raw_text: heading_text
        )
        heading.children << Kramdown::Element.new(:text, heading_text)
        aside.children << heading
      end

      aside.children += el.children

      format_as_indented_block_html(:aside, aside.attr, inner(aside, indent), indent)
    end
  end
end
