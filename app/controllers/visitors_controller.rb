class VisitorsController < ApplicationController

  expose(:app_stat) { AppStatsDecorator.new nil }

  def index
  end

end
