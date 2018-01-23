# frozen_string_literal: true

require 'test_helper'

module Writedown
  class FigureTest < Minitest::Test
    def setup
      Writedown.reset
    end

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
        <img src="portrait.jpg" alt="" />  <figcaption>A portrait of the artist</figcaption>
        </figure>
      DOC

      assert_equal expected, render(source)
    end

    def test_configuring_captions
      Writedown.configure do |config|
        config.figure_captions = false
      end

      source = <<~DOC
        ![](portrait.jpg "A portrait of the artist")
      DOC

      expected = <<~DOC
        <figure>
        <img src="portrait.jpg" alt="" title="A portrait of the artist" /></figure>
      DOC

      assert_equal expected, render(source)
    end

    def test_configuring_caption_position_with_symbol
      Writedown.configure do |config|
        config.figure_caption_position = :above
      end

      source = <<~DOC
        ![](portrait.jpg "A portrait of the artist")
      DOC

      expected = <<~DOC
        <figure>
          <figcaption>A portrait of the artist</figcaption>
        <img src="portrait.jpg" alt="" /></figure>
      DOC

      assert_equal expected, render(source)
    end

    def test_configuring_caption_position_with_string
      Writedown.configure do |config|
        config.figure_caption_position = 'above'
      end

      source = <<~DOC
        ![](portrait.jpg "A portrait of the artist")
      DOC

      expected = <<~DOC
        <figure>
          <figcaption>A portrait of the artist</figcaption>
        <img src="portrait.jpg" alt="" /></figure>
      DOC

      assert_equal expected, render(source)
    end

    def test_configuring_preserved_titles
      Writedown.configure do |config|
        config.figure_preserve_title = true
      end

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
