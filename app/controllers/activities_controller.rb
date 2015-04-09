class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activities_params)
  end


  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
  end

  def delete
    @activity = Activity.find(params[:id])

    if @activity.destroy
      redirect_to activities_url
    else
      flash.now[:warning] = "Deletion failed for some reason. \n #{@activity.errors.inspect}"
      render :show
    end
  end

  private

  def activities_params
    fail
    params.require(:activities).permit(:name)
  end

end
