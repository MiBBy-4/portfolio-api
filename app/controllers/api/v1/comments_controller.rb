module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_commentable!

      def create
        @comment = @commentable.comments.build comments_params

        if @comment.save
          render json: {
            status: 201,
            comment: @comment
          }
        else
          render json: {
            status: 402,
            errors: @comment.errors.full_messages
          }
        end
      end

      private

      def comments_params
        params.require(:comment).permit(:body).merge(user: @current_user)
      end

      def set_commentable!
        klass = [News, Project].detect { |c| params["#{c.name.underscore}_id"] }
        raise 'Not valid classname' if klass.blank?

        @commentable = klass.find(params["#{klass.name.underscore}_id"])
      end
    end
  end
end