#encoding: utf-8
class HomeController < ApplicationController
  def index
    @workday = Workday.includes(:comments => :user, :messages => :member).last
    @start_date = Workday.pluck(:skype_date).first
  end

  def show
    @workday = Workday.includes(:comments => :user, :messages => :member).find_by_skype_date(params[:skype_date])
  end
end
