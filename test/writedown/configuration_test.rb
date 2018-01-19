# frozen_string_literal: true

require 'test_helper'

module Writedown
  class ConfigurationTest < MiniTest::Test
    def setup
      Writedown.reset
    end

    def test_default_configuration_values
      assert_equal %w(note info success warning danger link), Writedown.configuration.aside_headings
      assert_equal 'note', Writedown.configuration.aside_base_class
      assert_equal 4, Writedown.configuration.aside_heading_level
    end

    def test_config_updates_settings
      Writedown.configure do |config|
        config.aside_base_class = 'aside'
      end

      assert_equal 'aside', Writedown.configuration.aside_base_class
    end

    def test_resetting_configuration
      Writedown.configure do |config|
        config.aside_base_class = 'aside'
      end

      Writedown.reset

      assert_equal 'note', Writedown.configuration.aside_base_class
    end
  end
end
