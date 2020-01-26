class UsersController < ApplicationController
	def index
		client   = Showoff::API::Client.new
    @widgets = client.get_widgets("/users/#{params[:user_id]}/widgets")
	end
end
