class UsersController < ApplicationController

  def index
    # array of all users:
    @all_users = User.all
  end

  before_action :authenticate_user!

  # match current_user fave by user_id
  def show
    @user = User.find(params[:id])
  end

  def choose_favorites_action
    @message = "Choose your favorites!"
    @user_id = current_user.id
    @user = User.find(@user_id)
    @user_favorites = @user.favorites
  end

  def add_favorite
    puts "Triggered add_favorite action"
    # if @new_favorite = User.favorite
    @news_source = params[:source]
    @new_favorite = Favorite.create(
    user_id: params[:user_id],
    source: params[:source]
    )
  end

  #CHANGE THIS TO DELETE
  def remove_favorite
    puts "Triggered remove_favorite action"

    @fave_to_delete_arr = Favorite.where(
    user_id: params[:user_id],
    source: params[:source]
    )
    # .delete or destroy only takes the Id of the row in the favorites table
    @delete_favorite = Favorite.delete(@fave_to_delete_arr[0].id)
    puts @delete_favorite
  end
end
