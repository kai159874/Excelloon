class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    if params[:type] =="all"
      @balloons = Balloon.all.order(id: "DESC").page(params[:page]).per(60)
      @type = "all"
    else
      @balloons = Balloon.find(Report.group(:balloon_id).order('count(balloon_id) DESC').pluck(:balloon_id))
      @balloons = Kaminari.paginate_array(@balloons).page(params[:page]).per(60)
    end
  end
end
