require 'net/http'
require 'json'

class MakeupController < ApplicationController
  def index
    url = URI("http://makeup-api.herokuapp.com/api/v1/products.json")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)

    response = http.request(request)
    @makeup_data = JSON.parse(response.body)

    render json: @makeup_data
  end
end
