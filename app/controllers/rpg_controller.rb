class RpgController < ApplicationController
  def index
    session[:activities]||=[]
    session[:gold]||=0
    @gold=session[:gold]
    @activities=session[:activities]
  end

  def new
    if params[:building]=='farm'
      gold=rand(10 .. 20)
    elsif params[:building]=='cave'
      gold=rand(5 .. 10)
    elsif params[:building]=='house'
      gold=rand(2 .. 5)
    elsif params[:building]=='casino'
      gold=rand(-50 .. 50)
    end

    if gold>0
      session[:activities]<< "Earned #{gold} golds from the #{params[:building]}! (#{Time.now.strftime('%Y/%m/%d %l:%M %P')})"
    else
      session[:activities]<< "Lost #{gold} golds from the casino! (#{Time.now.strftime('%Y/%m/%d %l:%M %P')})"
    end
    session[:gold] += gold
    redirect_to :root
  end





  def reset
    session.clear
    redirect_to :root
  end
end
