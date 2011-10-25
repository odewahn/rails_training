class ShoutsController < ApplicationController
  
  before_filter :authenticate , only: [:create]
  
  def index
    @shout = Shout.new
    @shouts = Shout.page(params[:page]).per(1)
  end

  def create
    @shout = Shout.new(params[:shout])
    @shout.user = current_user
    if @shout.save
      redirect_to shouts_url, notice: "Shouted!"
    else
      @shouts = Shout.all
      render "index"
    end
  end
end
