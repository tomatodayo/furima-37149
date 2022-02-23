class BuysController < ApplicationController

  def index
    @buy_send = BuySend.new
  end

end
