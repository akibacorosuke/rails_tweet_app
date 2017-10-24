class HomeController < ApplicationController

  before_action :forbid_login_user, {only:[:top]}

  def top
  end
  def home
  	
  end
  def about
  	
  end
end
