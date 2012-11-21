class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_workday
  def show
    @comments = @workday.comments.include(:users)
  end

  def create
    current_user.comments.create(:workday => @workday, :message => params[:comment][:message])
    redirect_to :back
  end

  private

  def find_comment
    @workday = Workday.find(params[:workday_id])
  end

end
