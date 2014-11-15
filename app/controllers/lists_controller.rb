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

  end

end
