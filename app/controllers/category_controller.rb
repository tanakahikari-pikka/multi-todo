class CategoryController < ApplicationController
  def new
    @category = Category.new
    5.times {@category.lists.build }
  end

  def index
    @categories = Category.all
    @category = Category.new
    @list = @category.lists
  end

  def show
    @category = Category.find(params[:id])
    @lists = @category.lists
  end

  def edit
    @category = Category.includes(:lists).find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_index_path
    else
      @list = List.new
      @categories = Category.all
      render :index
    end
  end


  def update
    @category = Category.find(params[:id])
    ActiveRecord::Base.transaction do
      @category.update_attributes!(category_params)
      List.multi_update(lists_params)
      redirect_to category_index_path
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to category_index_path
    else
      @categories = Category.all
      render :index
    end
  end

  private
  def category_params
    params.require(:category).permit(:name,lists_attributes:[:todo,:done])
  end
  def lists_params
    params.require(:category).permit(lists: [:todo,:done])[:lists]
  end
end