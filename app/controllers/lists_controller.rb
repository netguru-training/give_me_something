class ListsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
expose(:list)
expose(:lists)
expose(:gifts) { list.gifts.order("name ASC") }

  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
    #puts list_params
    #raise

    list = Lists::AddGiftsFromForm.new(list_params, current_user).call
    if list
      redirect_to list_path(list), notice: 'List was successfully created.'
    else
      render action: 'new'
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, gifts_attributes: [:name, :description])
  end

end
