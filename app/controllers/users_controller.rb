class UsersController < ApplicationController
  before_filter :authenticate_user!
  def last_url

  end

  def like
    message = Message.find(params[:message_id])
    like = message.likes.build(:user_id => current_user.id)
    render :json => {:status => like.save, :count => message.reload.likes_count}
  end


end
