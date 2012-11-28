#encoding: utf-8
class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_workday

  def create
    comment = current_user.comments.build(:workday_id => @workday.id, :body => params[:comment][:body])
    if comment.save
      flash[:notice] = "Комментарий добавлен"
    else
      flash[:alert] = "Чет не получилось добавить комментарий"
    end
    redirect_to workday_path(@workday.skype_date)
  end

  private

  def find_workday
    @workday = Workday.find(params[:workday_id])
  end

end
