class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to categories_path
    end
  end
end
