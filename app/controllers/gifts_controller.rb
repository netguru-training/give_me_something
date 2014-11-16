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

  def toggle_buyer
    if gift.buyer_id.present?
      gift.buyer_id = nil
      gift.save!
      redirect_to :back, notice: "You resigned"
    else
      gift.buyer = current_user
      gift.save!
      redirect_to :back, notice: "You are going to buy this!!"
    end
  end

  private

  def gift_params
    params.require(:gift).permit(:name, :description, :buyer_id)
  end

end
