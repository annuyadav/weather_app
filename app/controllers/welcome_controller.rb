class WelcomeController < ApplicationController

  before_action :fetch_query, only: [:location]

  def index
  end

  def location
    @location = Location.new(@query)
    if @location.error?
      flash[:error] = @location.error['message']
      render action: :index
    else
      @location.update_info
    end
  end

  private

  def location_params
    params.permit(:city, :country, :latitude, :longitude, :zip)
  end

  def fetch_query
    @query = []
    if location_params['city'].present?
      @query << "q=#{location_params[:city]}"
      @query << location_params[:country] if location_params[:country].present?
      @query = @query.join(',')
    elsif location_params[:latitude].present?
      @query << "lat=#{location_params[:latitude]}"
      @query << "lon=#{location_params[:longitude]}" if location_params[:longitude].present?
      @query = @query.join('&')
    elsif location_params[:zip].present?
      @query << "zip=#{location_params[:zip]}"
      @query << "#{location_params[:country]}" if location_params[:country].present?
      @query = @query.join(',')
    end
    if @query.blank?
      flash[:error] = 'Please enter some parameters to proceed'
      render action: :index
    end
  end
end
