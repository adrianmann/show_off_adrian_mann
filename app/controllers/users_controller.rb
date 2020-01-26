class UsersController < ApplicationController
	def index
    @widgets = client.get_widgets("/users/#{params[:user_id]}/widgets")
	end

	def login_form

	end

	def login
    client.submit("/oauth/token", {"grant_type" => "password",
                                   "client_id" => "#{ENV["CLIENT_ID"]}",
                                   "client_secret" => "#{ENV["CLIENT_SECRET"]}",
                                   "username" => params[:username],
                                   "password" => params[:password]})
	end

	def new

	end

	def create
    client.submit("/users", {"client_id" => "#{ENV["CLIENT_ID"]}",
	                           "client_secret" => "#{ENV["CLIENT_SECRET"]}",
	                           "user" => {"first_name" => params[:first_name],
	                                      "last_name" =>  params[:last_name],
	                                      "password" =>   params[:password],
	                                      "email" =>      params[:email],
	                                      "image" =>      "https://static.thenounproject.com/png/961-200.png"}})
	end

	def edit

	end

	def update

	end

  private

  def client
    Showoff::API::Client.new
  end
end
