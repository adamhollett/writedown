# frozen_string_literal: true

require 'test_helper'

module Writedown
  class CheckboxTest < Minitest::Test
    def setup
      Writedown.reset
    end

    def teardown
      Writedown.reset
    end

    def test_basic_checkbox
      source = <<~DOC
        [ ] Check me!
      DOC

      expected = <<~DOC
        <p><input type="checkbox" id="checkbox-1" /><label for="checkbox-1">Check me!</label></p>
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
            <p><input type="checkbox" id="checkbox-1" /><label for="checkbox-1">Check me!</label></p>
          </li>
        </ul>
      DOC

      assert_equal expected, render(source)
    end

    def test_configuring_checks
      Writedown.configure do |config|
        config.checkbox_checks << 'y'
      end

      source = <<~DOC
        [y] I am checked
      DOC

      expected = <<~DOC
        <p><input type="checkbox" id="checkbox-1" checked="true" /><label for="checkbox-1">I am checked</label></p>
      DOC

      assert_equal expected, render(source)
    end

    def test_configuring_base_id
      Writedown.configure do |config|
        config.checkbox_base_id = 'item'
      end

      source = <<~DOC
        [ ] Check me
      DOC

      expected = <<~DOC
        <p><input type="checkbox" id="item-1" /><label for="item-1">Check me</label></p>
      DOC

      assert_equal expected, render(source)
    end
  end
end
