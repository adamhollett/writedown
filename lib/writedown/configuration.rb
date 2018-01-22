# frozen_string_literal: true

module Writedown
  class << self
    def configuration
      @configuration ||= Configuration.new
    end
    alias_method :config, :configuration

    def reset
      @configuration = Configuration.new
    end

    def configure
      yield(configuration)
    end
  end

  class Configuration
    attr_accessor(
      :aside_headings,
      :aside_base_class,
      :aside_class_separator,
      :aside_heading_level,
      :aside_show_headings,
      :checkbox_checks,
      :checkbox_base_id,
      :checkbox_id_separator
    )

    def initialize
      set_default_configuration
    end

    def set_default_configuration
      @aside_headings        = %w(note info success warning danger link)
      @aside_base_class      = 'note'
      @aside_class_separator = '--'
      @aside_heading_level   = 4
      @aside_show_headings   = true

      @checkbox_checks       = %w(x X)
      @checkbox_base_id      = 'checkbox'
      @checkbox_id_separator = '-'
    end
  end
end
