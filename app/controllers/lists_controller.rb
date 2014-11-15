class ListsController < ApplicationController
before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
expose(:list, finder: :find_by_slug, finder_parameter: :slug)
expose(:lists)

  def index
  end

  def show
  end

  def edit
  end

  def new
  end
end
