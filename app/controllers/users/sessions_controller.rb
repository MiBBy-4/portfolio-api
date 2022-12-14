# frozen_string_literal: true

module Users
  class SessionsController < ApplicationController
    def create
      user = User.find_by(email: params['users']['email']).try(:authenticate, params['users']['password'])

      if user
        session[:user_id] = user.id
        render json: {
          status: 201,
          logged_in: true,
          user: user
        }
      else
        render json: {
          status: 422,
          errors: 'User is not find or password is incorrect'
        }
      end
    end

    def logged_in
      if @current_user
        render json: {
          logged_in: true,
          user: @current_user
        }
      else
        render json: {
          logged_in: false
        }
      end
    end

    def logout
      reset_session
      render json: {
        status: 200,
        logged_out: true
      }
    end
  end
end
