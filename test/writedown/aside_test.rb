# frozen_string_literal: true

require 'test_helper'

module Writedown
  class AsideTest < Minitest::Test
    parallelize_me!

    def test_basic_aside
      source = <<~DOC
        > Note:
        > Beware of dog!
      DOC

      expected = <<~DOC
        <aside class="aside aside--note">
          <h4 id="note">Note</h4>
          <p>Beware of dog!</p>
        </aside>
      DOC

      assert_equal expected, render(source)
    end

    def test_aside_types
      Writedown::Aside::ASIDE_HEADINGS.each do |type|
        source = <<~DOC
          > #{type.capitalize}:
          > Lorem ipsum dolor sit amet.
        DOC

        expected = <<~DOC
          <aside class="aside aside--#{type}">
            <h4 id="#{type}">#{type.capitalize}</h4>
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
        <aside class="aside aside--note">
          <h4 id="note">Note</h4>
          <p>The connector should look like this: <img src="connector.jpg" alt="" /></p>
        </aside>
      DOC

      assert_equal expected, render(source)
    end
  end
end
