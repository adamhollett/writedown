# frozen_string_literal: true

require 'test_helper'

module Writedown
  class CheckboxTest < Minitest::Test
    parallelize_me!

    def test_basic_checkbox
      source = <<~DOC
        [ ] Check me!
      DOC

      expected = <<~DOC
        <p>
          <input type="checkbox" id="checkbox-1" />
        <label for="checkbox-1">Check me!</label></p>
      DOC

      assert_equal expected, render(source)
    end

    def test_checkbox_in_list
      source = <<~DOC
        - [ ] Check me!
      DOC

      expected = <<~DOC
        <ul>
          <li>
            <p>
              <input type="checkbox" id="checkbox-1" />
        <label for="checkbox-1">Check me!</label>    </p>
          </li>
        </ul>
      DOC

      assert_equal expected, render(source)
    end
  end
end
