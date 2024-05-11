class Public::BalloonStickersController < ApplicationController

  def create
    balloon_sticker = BalloonSticker.new
    if BalloonSticker.find_by(balloon_id: params[:balloon_id], sticker_id: params[:sticker_id]).present?
      balloon_sticker = BalloonSticker.find_by(balloon_id: params[:balloon_id], sticker_id: params[:sticker_id])
      balloon_sticker.quantity += 1
      balloon_sticker.update(quantity: balloon_sticker.quantity)
      # ↓非同期までの仮置き
      redirect_to request.referer, notice: "ステッカー追加"
    else
      balloon_sticker.balloon_id = params[:balloon_id]
      balloon_sticker.sticker_id = params[:sticker_id]
      balloon_sticker.quantity = 1
      if balloon_sticker.save
        redirect_to root_path, notice: "ステッカー新規登録成功"
      end
    end
  end

  # def create
  #   cart_item = CartItem.new(cart_item_params)
  #   cart_item.customer_id = current_customer.id
  #   if cart_item.amount == nil
  #     @item = cart_item.item_id
  #     redirect_to item_path(@item)
  #   else
  #     if CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: current_customer.id).present?
  #       cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: current_customer.id)
  #       cart_item.amount += params[:cart_item][:amount].to_i
  #       cart_item.update(amount: cart_item.amount)
  #       redirect_to cart_items_path, notice: "カートに商品を追加しました。"
  #     else
  #       cart_item.save
  #       redirect_to cart_items_path, notice: "カートに商品を追加しました。"
  #     end
  #   end
  # end


end
