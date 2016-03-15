class UsersController < ApplicationController
  
  def index

  end

  def new
    @user = User.new
  end

  def create
    user_count > 26 ? user_count = User.count % 26 : user_count = (User.count)+1
    @user = User.create(user: "u#{user_count}", profile_function(user_count))
    # if user_count == 0
    #   @user = User.create(user: "u1")
    # else
    #   user_count = User.count
    #   @user = User.create(user: "u")

    # end
  end

  private
  def profile_function(user_count)
    profile_array = []
    for 

  end
  
end
