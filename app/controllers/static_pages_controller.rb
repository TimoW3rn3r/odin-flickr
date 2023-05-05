class StaticPagesController < ApplicationController
  def index
    @photos = []
    if not params[:flickr_id]
      return
    end

    flickr = ApplicationController::FLICKR
    photos_info = flickr.people.getPhotos(user_id: params[:flickr_id])
    @photos = photos_info.map { |photo| Flickr.url_z(photo) }
  end
end
