# frozen_string_literal: true

require 'test_helper'

module Writedown
  class BlockquoteTest < Minitest::Test
    parallelize_me!

    def test_basic_blockquote
      source = <<~DOC
        > Four score and seven years ago...
      DOC

      expected = <<~DOC
        <blockquote>
          <p>Four score and seven years ago…</p>
        </blockquote>
      DOC

      assert_equal expected, render(source)
    end
  end
end
