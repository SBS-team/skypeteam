class HomeController < ApplicationController
  def index
    @workdays = Workday.includes(:messages => :member).all
  end
end
