class StaticController < ApplicationController
  
  def index
  	redirect_to myrooms_path if logged_in?
  end
  
end
