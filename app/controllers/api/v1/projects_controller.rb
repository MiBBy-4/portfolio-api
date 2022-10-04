# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :set_project, only: %i[show update destroy]

      def index
        @projects = Project.all

        render json: @projects.to_json
      end

      def show
        render json: {
          project: @project,
          comments: @project.comments
        }
      end

      def create
        @project = @current_user.projects.build project_params

        if @project.save
          render json: {
            status: 201,
            project: @project
          }
        else
          render json: {
            status: 402,
            errors: @project.errors.full_messages
          }
        end
      end

      def update
        if @project.update(project_params)
          render json: {
            status: 200,
            project: @project
          }
        else
          render json: {
            status: 422,
            errors: @project.errors.full_messages
          }
        end
      end

      def destroy
        @project.destroy
        render json: {
          status: 202
        }
      end

      private

      def project_params
        params.require(:project).permit(:title, :description, :start_date, :finish_date, :repository_link)
      end

      def set_project
        @project = Project.find(params[:id])
      end
    end
  end
end
