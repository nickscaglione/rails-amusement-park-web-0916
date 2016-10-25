class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to (@attraction)
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def add_user
    @attraction = Attraction.find(params[:id])
    User.find(session[:user_id]).attractions << @attraction
    redirect_to attractions_path
  end

  def index
    @attractions = Attraction.all
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to @attraction
  end
  private
  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :tickets, :happiness_rating, :min_height)
  end
end
