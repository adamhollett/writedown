# frozen_string_literal: true

require 'test_helper'

module Writedown
  class WritedownTest < Minitest::Test
    # parallelize_me!

    def test_aside
      input = <<~HEREDOC
        > Note:
        > Lorem ipsum dolor sit amet.
      HEREDOC

      assert_includes render(input), 'aside class="aside"'
    end

    def test_checkbox
      checkbox_output = <<~HEREDOC
        <input id="checkbox-1" type="checkbox">
        <label for="checkbox-1">A checkbox</label>
      HEREDOC

      assert_equal checkbox_output, render('[ ] A checkbox')
    end

    def test_figure
      skip "Don't worry about this for now"
      figure_output = <<~HEREDOC
        <figure>
          <img src="https://unsplash.it/200">
        </figure>
      HEREDOC

      assert_equal figure_output, render('![](https://unsplash.it/200)')
    end

    private

    def render(content)
      Kramdown::Document.new(content).to_writedown
    end
  end
end
