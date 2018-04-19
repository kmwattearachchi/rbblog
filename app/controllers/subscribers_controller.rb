class SubscribersController < ApplicationController
  include ApplicationHelper

  def index
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      cookies[:saved_load] = true
      flash[:success] = "Saved Successfully!"
      redirect_to root_path
    else
      redirect_to_url(subscribers_path, "Failed to save!","notice")
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name, :email,  :source)
  end
end
