class WebController < ApplicationController
  def index
    respond_to do |wants|
      wants.html
      wants.js { render :layout => "swap" }
    end
  end

  def login
    @account = Account.new
    respond_to do |wants|
      wants.html
      wants.js { render :layout => "swap" }
    end
  end

  def signup
    @account = Account.new
    respond_to do |wants|
      wants.html
      wants.js { render :layout => "swap" }
    end
  end
  
  def account
    respond_to do |wants|
      wants.html
      wants.js { render :layout => "swap" }
    end
  end
end
