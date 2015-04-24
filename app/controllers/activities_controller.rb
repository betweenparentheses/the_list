class ActivitiesController < ApplicationController
  layout "scaffold"
  respond_to :html, :json

  def index
    @activities = Activity.includes(:category).order(:category_id)
    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: { activities: @activities,
                                   categories: Category.all } }
    end
  end

  def show
    @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html #show.html.erb
      format.json { render json: @activity.to_json(include: [:category]) }
    end
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activities_params)

    respond_to do |format|
      if @activity.save
        format.html{redirect_to @activity}
        format.json{ render json: @activity.to_json({ include: [:category]}) }
      else
        flash.now[:warning] = "Failed to create\n#{@activity.errors.inspect}"
        render :new
      end
    end
  end


  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])


    if @activity.update(activities_params)
      redirect_to @activity
    else
      flash.now[:warning] = "Failed to update\n#{@activity.errors.inspect}"
      render :new
    end
  end

  def destroy
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.destroy
        format.html { redirect_to activities_url }
        format.json { render json: @activities }
      else
        flash.now[:warning] = "Deletion failed for some reason. \n #{@activity.errors.inspect}"
        render :show
      end
    end
  end

  private
  def activities_params
    params.require(:activity).
          permit(:name, :id, :category_id, :description, :location,
                 :expiration_date, :done).
          merge({ category_id: Category.find_by_name(params[:category]).id})
  end

end
