# frozen_string_literal: true

module Writedown
  class Utils
    class << self
      def slugify(string, sep = '-')
        slugified_string = string
        slugified_string = slugified_string.gsub(/[^\w\-_]+/, sep)
        unless sep.nil? || sep.empty?
          re_sep = Regexp.escape(sep)
          # No more than one of the separator in a row
          slugified_string = slugified_string.gsub(/#{re_sep}{2,}/, sep)
          # Remove leading/trailing separator
          slugified_string = slugified_string.gsub(/^#{re_sep}|#{re_sep}$/, '')
        end
        slugified_string.downcase
      end
    end
  end
end
