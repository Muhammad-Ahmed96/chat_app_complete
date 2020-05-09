class MessagesController < ApplicationController

  before_action :find_channel, only: [:index, :create]
  def index
    @messages = @channel.messages.order("created_at asc")
    @message = Message.new
    @channels = current_user.channels
    channel_user = ChannelsUsers.where(user_id: current_user.id, channel_id: params[:channel_id])
    channel_user.update(read: true)
    @notification_channel_ids = current_user.notification_channels.pluck(:id)
  end

  def create
    @message = @channel.messages.build(message_params)
    @message.user = current_user
    if message_params[:avatar].present?
      @message.msg_type = 1
    end
    if @message.save
      ActionCable.server.broadcast "chatroom_channel", message: render_message(@message)
    end
  end

  private
  def find_channel
    @channel = Channel.find(params[:channel_id])
  end

  def message_params
    params.require(:message).permit(:message,:avatar)
  end

  def render_message(message)
    render(partial: 'broadcast_message', locals: {message: message})
  end
end