class FermaController < ApplicationController
  def index
    @cows = Cow.all
    @bank = Bank.first
  end
  
  def market
    @cows = Cow.all
    @bank = Bank.first
  end

  def about

  end

  def new_cow
    @cow = Cow.new
    @cow.save
    redirect_to :action => "market"
  end

end
