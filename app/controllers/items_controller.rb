class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @items = Items.new
  end

end