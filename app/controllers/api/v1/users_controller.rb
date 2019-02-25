class Api::V1::UsersController < ApplicationController

  def create
    user = User.create(user_params) if valid_user?
    if user
      user.api_key = SecureRandom.urlsafe_base64
      user.save
      render json: UserSerializer.new(user)
    else
      render json: "Error: Passwords do not match or user email already taken."
    end
  end

  private


  def current_time # if you want to use a flash message in mod 4
    Time.now.strftime("%d/%m/%Y %H:%M")
  end

  def valid_user?
    new_email? && password_match?
  end

  def password_match?
    params[:password] == params[:password_confirmation]
  end

  def new_email?
    User.where(email: params[:email]).empty?
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
