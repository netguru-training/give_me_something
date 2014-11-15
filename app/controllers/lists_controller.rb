class ListsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
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

    if list.save
      Lists::AddGiftsFromText.new(list, list_gifts).call
      redirect_to category, notice: 'List was successfully created.'
    else
      render action: 'new'
    end
  end

  private

  def list_gifts
    list(params[:list][:gifts_])
  end
end
