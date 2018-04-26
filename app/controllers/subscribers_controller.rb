class SubscribersController < ApplicationController
  include ApplicationHelper

  def index
    logger.info("MainApp") { "Received connection from " }
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      cookies[:saved_load] = true
      redirect_to_url(root_path, "Saved Successfully!","success")
    else
      redirect_to_url(subscribers_path, "Failed to save!","notice")
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name, :email,  :source)
  end
end
