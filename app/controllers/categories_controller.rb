class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)

    if @category.save
      redirect_to @category
    else
      flash.now[:warning] = "Failed to create\n#{@category.errors.inspect}"
      render :new
    end
  end


  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
  end

  def delete
    @category = Category.find(params[:id])

    if @category.destroy
      redirect_to categories_url
    else
      flash.now[:warning] = "Deletion failed for some reason. \n #{@category.errors.inspect}"
      render :show
    end
  end

  private

  def categories_params
    params.require(:category).permit(:name, :id)
  end

end
