class ApplicationController < ActionController::Base
  require 'flickr'

  FLICKR = Flickr.new
end
