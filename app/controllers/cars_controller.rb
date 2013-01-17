class CarsController < ApplicationController

  def index
    @cars = Car.all

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @cars }
    end
  end

  def show
    @car = Car.find(params[:id])

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @car }
    end
  end

  def new
    @car = Car.new
  end

  def edit
    @car = Car.find(params[:id])
  end

  def create
    @car = Car.new(params[:car])
    if @car.save
      render json: @car, status: :created, location: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def update
    @car = Car.find(params[:id])
    if @car.update_attributes(params[:car])
      head :no_content
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    head :no_content
  end
end
