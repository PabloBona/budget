class HomeController < ApplicationController
  def index
    return unless user_signed_in?

    redirect_to transactions_path
  end
end
