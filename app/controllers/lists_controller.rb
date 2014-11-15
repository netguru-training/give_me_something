class ListsController < ApplicationController
before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
expose(:list)
expose(:lists)

  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
    params = project_params
    params[:user] = current_user
    List.create!(params)
  end

  private
  def project_params
    params.require(:list).permit(:name, gifts_attributes: [:name, :description])
  end

end
