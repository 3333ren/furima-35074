class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :item_set, only: [:show, :edit, :update, :destroy]
  before_action :user_select, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:purchase).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :describe, :category_id, :condition_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_set
    @item = Item.includes(:purchase).find(params[:id])
  end

  def user_select
    if @item.user_id == current_user.id && @item.purchase.blank?
      true
    else
      redirect_to root_path
    end
  end
end
