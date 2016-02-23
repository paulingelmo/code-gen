class HomeController < ApplicationController

  def index
    # login

    # logout

    @message = "You are currently "
    @message += if session[:user_id]
      'logged in.'
    else
      'logged out.'
    end

    # flash.now[:alert] = "Error!!1"

    @users = User.all
    @user = User.first
  end

  def login
    session[:user_id] = 1
    # flash[:notice] = "You have just logged in."
    redirect_to :back, notice: "You're in!"
    # redirect_to
  end

  before_action :redirect_unless_logged_in

  def private
    render :index
  end

  def logout
    session.delete(:user_id)
    # flash[:alert] = "You have just logged out."
    redirect_to :back, alert: "You've been kicked out."
  end

  def redirector
    redirect_to root_path
  end

  def post
    render plain: params.to_json
    # render plain: params[:user][:name]
  end

  def get
    render plain: params.to_json
  end

end
