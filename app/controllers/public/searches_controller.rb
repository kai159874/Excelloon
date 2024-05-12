class Public::SearchesController < ApplicationController

  def search
  end

  def user_search
    @keyword = params[:keyword]
    @result = User.find_by('public_uid LIKE ?', @keyword)
  end

end
