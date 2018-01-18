# frozen_string_literal: true

require 'test_helper'

module Writedown
  class FigureTest < Minitest::Test
    parallelize_me!

    def test_basic_figure
      source = <<~DOC
        ![](portrait.jpg)
      DOC

      expected = <<~DOC
        <figure>
        <img src="portrait.jpg" alt="" /></figure>
      DOC

      assert_equal expected, render(source)
    end

    def test_figure_with_caption
      source = <<~DOC
        ![](portrait.jpg "A portrait of the artist")
      DOC

      expected = <<~DOC
        <figure>
        <img src="portrait.jpg" alt="" title="A portrait of the artist" />  <figcaption>A portrait of the artist</figcaption>
        </figure>
      DOC

      assert_equal expected, render(source)
    end
  end
end
