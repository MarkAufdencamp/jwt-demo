class ProfileController < ApplicationController
  def show
    render json: @current_user.as_json(only: [:id, :username, :email])
  end
end
