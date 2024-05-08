class ApplicationController < ActionController::Base
  # フラッシュメッセージの色追加
  add_flash_types :success, :info, :warning, :danger
end
