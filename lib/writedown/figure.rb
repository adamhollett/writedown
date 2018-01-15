# frozen_string_literal: true

module Writedown
  module Figure
    def convert_figure(el, indent)
      el.type = :figure

      caption = el.children.first.attr['title']
      if caption
        caption_text = Kramdown::Element.new(:text, caption)
        caption_element = Kramdown::Element.new(:html_element, :figcaption, nil, category: :block)
        caption_element.children << caption_text
        el.children << caption_element
      end

      format_as_indented_block_html(el.type, el.attr, inner(el, indent), indent)
    end
  end
end
