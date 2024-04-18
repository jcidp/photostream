require "json"

class StaticPagesController < ApplicationController
  def view
    @photos = photos(params[:user_id])
  end

  private

  def photos(user_id)
    return [] unless user_id
    response = RestClient.get("https://www.flickr.com/services/rest/?method=flickr.people.getPhotos&api_key=#{ENV["flickr_api_key"]}&user_id=#{user_id}&format=json&nojsoncallback=1", accept: :json)
    owner_photos = JSON.parse(response.body).fetch("photos", {}).fetch("photo", {})
  end
end
