class ListController < ApplicationController
  def new
    @list = List.new
    @category = Category.find_by(id: params[:category_id])
  end

  def create
    category = Category.find(params[:category_id])
    list = List.new(list_params)
    list.category_id = category.id
    list.save
    redirect_to category_index_path
  end

  def edit
  end

  def show
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to category_index_path
  end


  def destroy
    List.find(params[:id]).destroy
    redirect_to category_index_path
  end
    private

    def list_params
      params.require(:list).permit(:todo,:category_id)
    end
end