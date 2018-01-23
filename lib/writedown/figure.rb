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
      figure.children << image

      # Add a caption to the figure if needed
      if Writedown.configuration.figure_captions && image.attr['title']
        caption_text = Kramdown::Element.new(:text, image.attr['title'])
        caption_element = Kramdown::Element.new(:html_element, 'figcaption', nil, category: :block)
        caption_element.children << caption_text
        image.attr['title'] = nil unless Writedown.configuration.figure_preserve_title

        # Add the figure caption
        case Writedown.configuration.figure_caption_position
        when :above
          figure.children.unshift(caption_element)
        else
          figure.children << caption_element
        end
      end

      format_as_indented_block_html('figure', figure.attr, inner(figure, indent), indent)
    end
  end
end
