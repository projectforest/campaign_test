class CampaignsController < ApplicationController
  $X = 0
  $Y = 0 
  $Z = 0
  $max_price = 1000000
  $campaign_list = []
    
  def index
    $X = (params[:x]).to_i
    $Y = (params[:y]).to_i
    $Z = (params[:z]).to_i
    @temp_list = []
   
    #campaign_single = {campaign_name: "", price: "", target_list: ""}
    #binding.pry
    # for i in 1..@Z
    #   Campaign.new(campaign_name: "campaign#{i}", price: "#{rand(0..@max_price)}", target_list: target_list_function)
    # end
    for i in 0..($Z-1)
      campaign_single = {campaign_name: "campaign#{i+1}", price: "#{rand(0..$max_price)}", target_list: target_list_function}
      @temp_list.push(campaign_single)
    end
    $campaign_list = @temp_list
    #render json: @campaigns.to_json(:except => [:created_at, :updated_at, :id])
    render json: $campaign_list
    #@campaigns = Campaign.all
    #render json: @campaigns.to_json(:except => [:created_at, :updated_at, :id])
  end

  def new
    
    @campaign = Campaign.new
  end

  def create
    for i in 1..$Z
      @campaign = Campaign.create(campaign_name: "campaign#{i}", price: "#{rand(0..$max_price)}", target_list: target_list_function)
      @campaign.save

    end
    redirect_to campaigns_path


  end

  private

  def attr_list_function(number) 
    attr_list_array = []
    for i in 0..(rand($X-1))
      attr_list_array.push((number+65).chr + i.to_s)
    end
    return attr_list_array
  end
  
  def target_list_function
    target_list_array = []

    for i in 0..(rand($Y-1))
      target_hash = {target: "attr_" + (i+65).chr, attr_list: attr_list_function(i)}
      target_list_array.push(target_hash)
    end

    return target_list_array
  end



end
