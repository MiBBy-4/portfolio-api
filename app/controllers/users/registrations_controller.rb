# frozen_string_literal: true

module Users
  class RegistrationsController < ApplicationController
    def create
      user = User.new user_params

      if user.save
        session[:user_id] = user.id

        render json: {
          status: 201,
          user: user
        }
      else
        render json: {
          status: 422,
          errors: user.errors.full_messages
        }
      end
    end

    private

    def user_params
      params.require(:users).permit(:email, :name, :password, :password_confirmation)
    end
  end
end
