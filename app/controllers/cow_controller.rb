class CowController < ApplicationController

def index
    @cows = Cow.all
    @bank = Bank.first


    respond_to do |format|
      format.html 
      format.js  
end
end

def show
  @cow = Cow.find(params[:id])
end

def new
  @cow = Cow.new
  @bank = Bank.first
  if @bank.many-1000.0 > 0
    Bank.update_all :many => @bank.many-1000.0
    @cow.save
  @cows = Cow.all
  end
  respond_to do |format|
        format.html {}
        format.js
       
  end

end

def edit
  @cow = Cow.find(params[:id])  
end

def create
    @cow = Cow.new(params[:cow])
     
     respond_to do |format|
      if @cow.save
        format.html { redirect_to @cow, notice: 'Cow created' }
        format.json { render json: @cow, status: :created, location: @cow }
      else
        format.html { render action: "new" }
        format.json { render json: @cow.errors, status: :unprocessable_entity }
      end
    end
end

def update
    @cow = Cow.find(params[:id])
    @cow.name = params[:cow][:name]
    @cow.save
    respond_to do |format|
        format.html { redirect_to :controller => "cow", :action=> "index" }
        format.json { head :no_content }
    end
  end

def milk_destroy
    @bank = Bank.first
    @cow = Cow.find(params[:id])
    Bank.update_all :volume_milk => @bank.volume_milk+@cow.milk
    @cow.milk = 0.0
    @cow.save
    @cows=Cow.all


    respond_to do |format|
      format.html 
      format.js  
    end
end

def sell_milk
    @bank = Bank.first
    Bank.update_all :many =>@bank.many+@bank.volume_milk * 0.1, :volume_milk => 0.0
    @cows = Cow.all

    respond_to do |format|
      format.html { }
      format.js  
      
    end
end

def market
    @cows = Cow.all
    @bank = Bank.first
end

def milk_add
  @cows = Cow.all
  mil = Random.new
  @cows.each { |cow| 
    if (cow.milk+=mil.rand(3.0).round(3)) <= 5.0
       cow.save
    end
  }
    respond_to do |format|
      format.js

end
end

  def destroy
    @bank = Bank.first
    Bank.update_all :many => @bank.many+900.0
    @cow = Cow.find(params[:id])
    @cow.destroy
    @cows = Cow.all

    respond_to do |format|
      format.html { redirect_to :controller => "cow", :action=> "market" }
      format.js { render "destroy" }
      format.json { head :no_content }
    end

  end
end
