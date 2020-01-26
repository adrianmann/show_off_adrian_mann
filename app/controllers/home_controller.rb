class HomeController < ApplicationController
  def index
    url = "#{ENV['SHOW_OFF_URL']}/widgets/visible?client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}"
    RestClient::Request.execute(method: :get, url: url)do |response, request, result|
      response_body = JSON.parse(response.body)
      case response_body["message"]
      when "Success"
      puts response_body
        @widgets = response_body["data"]["widgets"]
      else
        Rails.logger.debug "Loading widgets from '#{url}' failed."
        @widgets = []
      end
    end
    puts "@widgets: #{@widgets}"
    # puts "@widgets: #{@widgets[0]["data"]}"
    @widgets
  end
end
