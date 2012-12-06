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
