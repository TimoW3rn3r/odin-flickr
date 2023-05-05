class StaticPagesController < ApplicationController
  def index
    @photos = []
    if not params[:flickr_id]
      return
    end

    flickr = ApplicationController::FLICKR
    user_id = params[:flickr_id]
    photos_info = flickr.people.getPhotos(user_id:)

    user_info = flickr.people.getInfo(user_id:)
    @realname = user_info.realname
    @user_photos = user_info.photosurl
    @photos = photos_info.map { |photo| Flickr.url_z(photo) }
  end
end
