# frozen_string_literal: true

require 'simplecov'

SimpleCov.start do
  add_filter 'test'
end

require 'bundler/setup'
require 'kramdown'
require 'writedown'
require 'minitest/autorun'
require 'byebug'

def render(content)
  Kramdown::Document.new(content).to_writedown
end
