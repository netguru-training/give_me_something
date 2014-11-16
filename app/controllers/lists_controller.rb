class ListsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
expose(:list, finder: :find_by_slug, finder_parameter: :slug, params: :list_params)

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
    list.assign_attributes create_list_params
    list.save
    if list.persisted?
      redirect_to list_path(list), notice: 'List was successfully created.'
    else
      render action: :new
    end
  end

  private

  def list_params
    params.permit(:list).permit(:name, gifts_attributes: [:name, :description, :_destroy])
  end

  def create_list_params
    params.require(:list).permit(:name, gifts_attributes: [:name, :description, :_destroy])
  end

end
