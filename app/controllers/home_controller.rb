class HomeController < ApplicationController
  def index
    @workday = Workday.includes(:messages => :member).last
    @start_date = Workday.pluck(:skype_date).first
  end

  def show
    @workday = Workday.includes(:messages => :member).find_by_skype_date(params[:skype_date])
  end
end
