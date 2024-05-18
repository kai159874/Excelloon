class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    if params[:type] =="all"
      @balloons = Balloon.all
      @type = "all"
    else
      @balloons = Balloon.find(Report.group(:balloon_id).order('count(balloon_id) DESC').pluck(:balloon_id))
    end
  end
end
