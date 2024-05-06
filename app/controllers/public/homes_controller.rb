class Public::HomesController < ApplicationController
  def top
    @balloons = Balloon.all
  end

  def about
  end
end
