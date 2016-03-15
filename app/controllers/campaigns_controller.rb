class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
    render json: @campaigns.to_json(:except => [:created_at, :updated_at, :id])
  end

end
