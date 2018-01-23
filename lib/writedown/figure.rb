# frozen_string_literal: true

module Writedown
  module Figure
    def convert_figure(el, indent)
      # Create the figure element
      figure = Kramdown::Element.new(
        :html_element, 'figure', el.attr,
        location: el.options[:location], category: :block
      )

      # Add the image element to the figure
      image = el.children.first
      image = Kramdown::Element.new(
        :html_element, 'img', image.attr,
        category: :block, is_closed: true
      )
      figure.children << image

      # Add a caption to the figure if needed
      if Writedown.configuration.figure_captions && image.attr['title']
        caption_text = Kramdown::Element.new(:text, image.attr['title'])
        caption_element = Kramdown::Element.new(:html_element, 'figcaption', nil, category: :block)
        caption_element.children << caption_text
        figure.children << caption_element
        image.attr['title'] = nil unless Writedown.configuration.figure_preserve_title
      end

      format_as_indented_block_html('figure', figure.attr, inner(figure, indent), indent)
    end
  end
end
