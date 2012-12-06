#encoding: utf-8
class FeedbacksController < ApplicationController

  def create
    feedback = Feedback.new(:body => params[:body], :email => params[:email])
    feedback.user_id = current_user.try(:id)

    if feedback.save
      flash[:notice] = "Отзыв добавлен, мы свяжемся с вами если вы этого хотели"
    else
      flash[:alert] = "Ой йо йо паломалася, надо дернуть пиво и починить"
    end
    redirect_to workday_path(@workday.skype_date)
  end
end
