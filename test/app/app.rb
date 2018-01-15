# frozen_string_literal: true

require_relative '../test_helper'
require 'sinatra'

# Set up a basic Tilt mapping for Writedown
module Tilt
  class WritedownTemplate < KramdownTemplate
    def evaluate(*)
      @output ||= @engine.to_writedown
    end
  end
end
Tilt.register Tilt::WritedownTemplate, :md

helpers do
  def markdown(*args)
    render(:md, *args)
  end
end

get '/' do
  markdown :index, layout_engine: :erb
end
