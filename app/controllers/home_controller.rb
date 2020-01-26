class HomeController < ApplicationController
  def index
    url    = "/widgets/visible"
    client = Showoff::API::Client.new
    @widgets = if params[:term].present?
                 client.get_widgets(url, {term: params[:term]})
               else
                 client.get_widgets(url)
               end
  end
end
