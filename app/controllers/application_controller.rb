class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   before_action :load_sidebercategories
  def load_sidebercategories
  	  @sidebercategories = Category.all
  end
end
