class HomeController < ApplicationController
  def index
    @channels = current_user.channels
    # @all_channels = Channel.all.order(:created_at)
    @notification_channel_ids = current_user.notification_channels.pluck(:id)
  end
end
