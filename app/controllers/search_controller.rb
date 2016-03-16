class SearchController < ApplicationController

  def index
    @users = User.all
    @campaigns = Campaign.all
    if params[:searchparams]
      @user = @users.where(user_name: params[:searchparams])
      #@user.
     
      @response = search_function(@user, @campaigns)
      #binding.pry
      render json: @response.to_json
      #render json: @campaigns.to_json
    end


  end

  protected

  def input_function
    params.require(:search).permit(:searchparams)
  end

  def search_function(temp_user, temp_campaigns)
    @result = {winner: ""}
    @max_price = 0
    temp_campaigns.each do |temp_campaign|

      if temp_user[0][:target_list].length == temp_campaign[:target_list].length
        for i in 0..((temp_user[0][:target_list].length)-1)
       
          if temp_campaign[:target_list][i]["attr_list"].include? temp_user[0][:target_list][i]["attr_list"]
            #binding.pry
            if temp_campaign[:price] > @max_price
              @max_price = temp_campaign[:price] 
              @result[:winner] = temp_campaign[:campaign_name]
              
            end
          end

        end
        return @result
      end

    end
    @result[:winner] = "none"
    return @result


  end
end
