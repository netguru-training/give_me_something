class GiftsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  expose(:gift)
  expose(:gifts)

  def index
  end

  def show
  end

  def edit
  end

  def new
  end
end
