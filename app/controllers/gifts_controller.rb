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

  private

  def gift_params
    params.require(:gift).permit(:name, :description)
  end

end
