# frozen_string_literal: true

require 'test_helper'

module Writedown
  class ImageTest < Minitest::Test
    parallelize_me!

    def test_local_image_dimensions
      source = <<~DOC
        An apple: ![](test/assets/apple.jpg)
      DOC

      expected = <<~DOC
        <p>An apple: <img src="test/assets/apple.jpg" alt="" width="400" height="456" /></p>
      DOC

      assert_equal expected, render(source)
    end

    def test_remote_image_dimensions
      source = <<~DOC
        A picture: ![](https://picsum.photos/200)
      DOC

      expected = <<~DOC
        <p>A picture: <img src="https://picsum.photos/200" alt="" width="200" height="200" /></p>
      DOC

      assert_equal expected, render(source)
    end
  end
end
