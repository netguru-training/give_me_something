class GiftsController < ApplicationController
  before_action :authenticate_user!
  expose(:gift)
  expose(:gifts)

  def new
  end

  def edit
  end

  def show
  end
end
