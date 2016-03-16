class UsersController < ApplicationController
  
  def index
    @users = User.all
    render json: @users.to_json(:except => [:created_at, :updated_at, :id])
  end


  def new
    @user = User.new
    # user_count = (User.count % 26)+1
    
    # @user = User.create(user_name: "u#{user_count}", profile: profile_function(user_count))
    # #
    # redirect_to users_path

  end

  def create
    user_count = (User.count % 26)+1
    
    @user = User.create(user_name: "u#{(User.count)+1}", target_list: profile_function(user_count))
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
    
    
  end

  private
  def profile_function(user_count)
    profile_array = []
    for i in 1..(user_count)
      profile_hash = {target: "attr_" + (i+64).chr, attr_list: (i+64).chr + rand(1..4).to_s}
      profile_array.push(profile_hash)
    end
    return profile_array

  end
  
end
