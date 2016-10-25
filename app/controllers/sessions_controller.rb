class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :index]

  def index
  end

  def new
    @users = User.all
  end

  def create
    user = User.find_by(name: params[:name])

        if user.authenticate(params[:password])
         login(user)
         # Rack::Response.new(status: 304, 'users/1')
         redirect_to user_path(user)
       else
         redirect_to login_path
       end
       # askljaslkjasljasklj => 1
       # asajlkasjlksajdkljaskldj => 2
  end

end
