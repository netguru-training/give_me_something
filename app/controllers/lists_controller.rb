class ListsController < ApplicationController
before_action :authenticate_user!, except: [:show]
expose(:list, finder: :find_by_slug, finder_parameter: :slug, params: :list_params)

expose(:lists)
expose(:gifts) { GiftDecorator.decorate_collection(list.gifts.order("name ASC")) }

  def index
  end

  def show
    self.list = List.find_by_slug(params.require(:slug))
  end

  def edit
    self.list = List.find_by_slug(params.require(:slug))
  end

  def new
    self.list.gifts << Gift.new
  end

  def update
    self.list = List.find_by_slug(params.require(:slug))
    list.update_attributes create_list_params
    if list.save
      redirect_to list_path(list), notice: 'List was successfully updated.'
    else
      render action: :edit
    end
  end

  def create
    list.assign_attributes create_list_params
    list.user = current_user
    list.save
    if list.persisted?
      redirect_to list_path(list), notice: 'List was successfully created.'
    else
      render action: :new
    end
  end

  def destroy
    self.list = List.find_by_slug(params.require(:slug))
    if list && list.destroy
      redirect_to lists_path, notice: 'List was successfully destroyed.'
    else
      redirect_to lists_path, notice: "List wasn't destroyed."
    end

  end

  private

  def list_params
    params.permit(:list).permit(:name, gifts_attributes: [:name, :description, :_destroy])
  end

  def create_list_params
    params.require(:list).permit(:name, gifts_attributes: [:name, :description, :_destroy, :id])
  end

end
