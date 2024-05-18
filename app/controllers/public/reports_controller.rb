class Public::ReportsController < ApplicationController

  def create
    @balloon = Balloon.find(params[:balloon_id])
    report = current_user.reports.new(balloon_id: @balloon.id)
    unless Report.exists?(user_id: current_user.id, balloon_id: @balloon.id)
      report.save
      redirect_to root_path, notice: "報告ありがとうございます。"
    else
      redirect_to request.referer, alert: "すでに報告しています"
    end
  end

end
