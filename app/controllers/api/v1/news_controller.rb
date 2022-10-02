# frozen_string_literal: true

module Api
  module V1
    class NewsController < ApplicationController
      before_action :set_news, only: %i[show update destroy]

      def index
        news = News.all
        render json: news.to_json
      end

      def show
        render json: @news
      end

      def create
        news = @current_user.news.build news_params

        if news.save
          render json: {
            status: 201,
            news: news
          }
        else
          render json: {
            status: 402,
            errors: news.errors.full_messages
          }
        end
      end

      def update
        if @news.update news_params
          render json: {
            status: 201,
            news: @news
          }
        else
          render json: {
            status: 402,
            errors: @news.errors.full_messages
          }
        end
      end

      def destroy
        @news.destroy
        render json: {
          status: 202
        }
      end

      private

      def news_params
        params.require(:news).permit(:title, :description)
      end

      def set_news
        @news = News.find(params[:id])
      end
    end
  end
end
