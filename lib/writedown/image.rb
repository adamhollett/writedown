# frozen_string_literal: true

require 'fastimage'

module Writedown
  module Image
    def convert_img(el, indent)
      dimensions = FastImage.size(el.attr['src'])
      if dimensions
        el.attr[:width]  = dimensions.first
        el.attr[:height] = dimensions.last
      end

      super
    end
  end
end
