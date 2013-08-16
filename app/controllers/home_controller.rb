#encoding: utf-8
class HomeController < ApplicationController
  before_filter :find_workday

  def index
    @start_date = Workday.pluck(:skype_date).first
  end

  def show
  end

  def about
  end

  def write_to_us
    email = params[:email]
    text = params[:text]
    if text.length < 10
      head :status => 403
    else
      AdminMailer.contact_us(email,text).deliver
      head :ok
    end

  end
  private

  def find_workday
    @workday = if params[:skype_date]
                 Workday.includes(:comments => :user, :messages => :member).find_by_skype_date(params[:skype_date])
               else
                 Workday.includes(:comments => :user, :messages => :member).last
               end
    @workday ||= Workday.new(:skype_date => Time.now)
    @comments = @workday.comments.page(params[:page]).per(50)
  end
end
