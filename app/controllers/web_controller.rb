class WebController < ApplicationController
  def index
    respond_to do |wants|
      wants.html
      wants.js { render :layout => "swap" }
    end
  end

  def login
    respond_to do |wants|
      wants.html
      wants.js { render :layout => "swap" }
    end
  end

  def signup
    respond_to do |wants|
      wants.html
      wants.js { render :layout => "swap" }
    end
  end
end
