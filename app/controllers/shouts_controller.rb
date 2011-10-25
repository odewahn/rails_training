class ShoutsController < ApplicationController
  
  before_filter :authenticate , only: [:create]
  
  def index
    @shout = Shout.new
    @shouts = Shout.page(params[:page]).per(10)
  end

  def create
    @shout = Shout.new(params[:shout])
    @shout.user = current_user
    respond_to do |format|
      if @shout.save
        format.html {redirect_to shouts_url, notice: "Shouted!"}
        format.js
      else
        format.html do
           @shouts = Shout.all
           render redirect_to shouts_url
        end
      end
    end
  end
end
