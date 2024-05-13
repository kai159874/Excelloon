class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @balloons = Balloon.all.order(id: "DESC")
  end
end
