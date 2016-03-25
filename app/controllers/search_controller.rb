class SearchController < ApplicationController

  $counter = 0
  def index
    $counter = 0
    @users = User.all
    @campaigns = Campaign.all
    if params[:searchparams]
      @user = @users.where(user_name: params[:searchparams])
      
     
      @response = search_function(@user, @campaigns)
      
      render json: @response.to_json
      
    end


  end

  def search_auto
    @users = User.all
    @campaigns = Campaign.all
    user_count = (User.count % 26)+1
    
    @new_user = User.create(user_name: "u#{(User.count)+1}", target_list: profile_function(user_count))
   
    

    @user = @users.where(user_name: "#{@new_user.user_name}")
      
     
    @response = search_function(@user, @campaigns)
    @response[:counter] = $counter + 1
    $counter = @response[:counter]
    render json: @response.to_json
    #redirect_to search_auto_path
  end

  protected

  def profile_function(user_count)
    profile_array = []
    for i in 1..(user_count)
      profile_hash = {target: "attr_" + (i+64).chr, attr_list: (i+64).chr + rand(1..200).to_s}
      profile_array.push(profile_hash)
    end
    return profile_array

  end

  def input_function
    params.require(:search).permit(:searchparams)
  end

  #search algorithm
  def search_function(temp_user, temp_campaigns)
    @result = {winner: ""}
    @max_price = 0
    temp_campaigns.each do |temp_campaign|

      if temp_user[0][:target_list].length == temp_campaign[:target_list].length
        for i in 0..((temp_user[0][:target_list].length)-1)
       
          if temp_campaign[:target_list][i]["attr_list"].include? temp_user[0][:target_list][i]["attr_list"]
            
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
