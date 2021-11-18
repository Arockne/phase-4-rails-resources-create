class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  def create
    if params[:bird].empty?
      render json: { error: "Empty object" }, status: :bad_request
    else
      bird = Bird.create(name: params[:name], species: params[:species])
      render json: bird, status: :created
    end

  end

end