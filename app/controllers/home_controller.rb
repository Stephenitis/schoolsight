class HomeController < ApplicationController
  require 'net/https'
  require 'json'

  def index
    uri = URI('https://api.getclever.com/v1.1/schools')

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request = Net::HTTP::Get.new(uri.request_uri)
    request.basic_auth('DEMO_KEY','')

    response = http.request(request)
    @response = JSON.parse(response.body)
    @response["data"].each do |school|

     School.create(
      name: school["data"]["name"], 
      phone: school["data"]["phone"])
    end
       # p school["data"]["principal"]["email"]

  end
end
