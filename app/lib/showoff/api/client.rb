module Showoff
  module API
    class Client
      include RestHelper

      def initialize(options = {})
        @options = options
      end

      def get_widgets(url, options = {term: ""})
        rest_client_request = get(root_url + url + client_info+ "&term=#{options[:term]}")
        parse_widgets(rest_client_request.body)
      end

      def submit(url, options={})
        puts "options: #{options}"
        rest_client_request = post(root_url + url, options)
        puts "rest_client_request: #{rest_client_request}"
        rest_client_request
      end

      private

      def parse_widgets(body)
        response_body = JSON.parse(body)
        case response_body["message"]
        when "Success"
          widgets = response_body["data"]["widgets"]
        else
          Rails.logger.debug "Loading user widgets from '#{url}' failed."
          widgets = []
        end

        widgets
      end

      def root_url
        "#{ENV["SHOW_OFF_HOST"]}api/v1"
      end

      def client_info
        "?client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}"
      end
    end
  end
end
