# frozen_string_literal: true

require 'fastimage'

module Writedown
  module Image
    def convert_img(el, indent)
      path = el.attr['src']
      unless Writedown::Utils.remote?(path)
        image_path = Dir.glob("**#{path}").first
        dimensions = FastImage.size(image_path)

        if dimensions
          el.attr[:width]  = dimensions.first
          el.attr[:height] = dimensions.last
        end
      end

      super
    end
  end
end
