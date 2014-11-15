class ListsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
expose(:list, finder: :find_by_slug, finder_parameter: :slug)

expose(:lists)
expose(:gifts) { GiftDecorator.decorate_collection(list.gifts.order("name ASC")) }

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
    if list.present?
      redirect_to list_path(list), notice: 'List was successfully created.'
    else
      render action: 'new', flash: { error: 'Invalid data provided. List not created.' }
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, gifts_attributes: [:name, :description])
  end

end
