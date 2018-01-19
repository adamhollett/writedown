# frozen_string_literal: true

require 'test_helper'

module Writedown
  class AsideTest < Minitest::Test
    def setup
      Writedown.reset
    end

    def test_basic_aside
      source = <<~DOC
        > Note:
        > Beware of dog!
      DOC

      expected = <<~DOC
        <aside class="note">
          <h4 id="note">Note</h4>
          <p>Beware of dog!</p>
        </aside>
      DOC

      assert_equal expected, render(source)
    end

    def test_aside_types
      Writedown.configuration.aside_headings
        .reject { |t| t == Writedown.configuration.aside_base_class }.each do |type|
        source = <<~DOC
          > #{type}:
          > Lorem ipsum dolor sit amet.
        DOC

        expected = <<~DOC
          <aside class="note note--#{type}">
            <h4 id="#{type}">#{type}</h4>
            <p>Lorem ipsum dolor sit amet.</p>
          </aside>
        DOC

        assert_equal expected, render(source)
      end
    end

    def test_aside_with_image
      source = <<~DOC
        > Note:
        > The connector should look like this: ![](connector.jpg)
      DOC

      expected = <<~DOC
        <aside class="note">
          <h4 id="note">Note</h4>
          <p>The connector should look like this: <img src="connector.jpg" alt="" /></p>
        </aside>
      DOC

      assert_equal expected, render(source)
    end

    def test_configuring_heading_level
      Writedown.configure do |config|
        config.aside_heading_level = 2
      end

      source = <<~DOC
        > Note:
        > Beware of dog!
      DOC

      expected = <<~DOC
        <aside class="note">
          <h2 id="note">Note</h2>
          <p>Beware of dog!</p>
        </aside>
      DOC

      assert_equal expected, render(source)
    end

    def test_configuring_show_heading
      Writedown.configure do |config|
        config.aside_show_headings = false
      end

      source = <<~DOC
        > Note:
        > Beware of dog!
      DOC

      expected = <<~DOC
        <aside class="note">
          <p>Beware of dog!</p>
        </aside>
      DOC

      assert_equal expected, render(source)
    end
  end
end
