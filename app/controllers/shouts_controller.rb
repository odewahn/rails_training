class ShoutsController < ApplicationController
  def index
    @shout = Shout.new
    @shouts = Shout.all
  end

  def create
    @shout = Shout.new(params[:shout])
    if @shout.save
      redirect_to shouts_url, notice: "Shouted!"
    else
      @shouts = Shout.all
      render "index"
    end
  end
end
