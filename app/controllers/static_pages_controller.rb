require "json"
require "rest-client"

class StaticPagesController < ApplicationController
  def view
    @photos = photos(params[:user_id])
  end

  private

  def photos(user_id)
    return [] unless user_id
    response = RestClient.get("https://www.flickr.com/services/rest/?method=flickr.people.getPhotos&api_key=c1c58b20755be4eb94b18f5d5a25310b&user_id=#{user_id}&format=json&nojsoncallback=1&api_sig=4ffca29d06f2d28e117847e4b02e473a", accept: :json)
    owner_photos = JSON.parse(response.body).fetch("photos", {}).fetch("photo", {})
  end
end
