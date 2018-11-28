class ApartmentsController < ApplicationController
  def index
    apartments = Apartment.all
    render json: apartments
  end

  def create
    apartment = Apartment.create(apartment_params)
    render json: apartment
  end

  def apartment_params
    params.require(:apartment).permit(:street1, :street2, :city, :postal_code, :state, :country, :building_manager, :manager_phone, :manager_hours)
  end

  def show
    @apartment = Apartment.find(params[:id])
    render json: @apartment
  end

end
