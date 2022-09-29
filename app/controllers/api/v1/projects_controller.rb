class Api::V1::ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  def index
    @projects = Project.all

    render json: @projects.to_json
  end

  def show
    render json: @project
  end

  def create
    @project = Project.new project_params

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
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
