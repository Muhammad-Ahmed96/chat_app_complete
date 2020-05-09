class ChannelsController < ApplicationController

  before_action :find_channel, only: [:add_new_user,:show, :edit, :update,:destroy]
  def new
    @channel = Channel.new
  end

  def index
    @channels = Channel.all
  end

  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      redirect_to root_path, notice: "Room Created Successfully"
    else
      redirect_to root_path, alert: "Error Creating Room"
    end
  end

  def edit
  end
  def add_new_user
    @users = User.all
  end

  def update
    if @channel.update(channel_params)
      redirect_to channels_path, notice: "Room Updated Successfully."
    else
      redirect_to channels_path, alert: "Error updating the Room."
    end
  end

  def remove_user
    @user_channel = ChannelsUsers.where(channel_id: params[:channel_id], user_id: params[:id])
    @user_channel.destroy_all
    redirect_to root_path, notice: "User removed Successfully"
  end

  def destroy
    @channel.destroy
    redirect_to channels_path, notice: "Room deleted successfully."
  end

  def show
    @users = @channel.users
  end


  private

  def find_channel
    @channel = Channel.find(params[:id])
  end

  def channel_params
    params.require(:channel).permit(:name)
  end
end