class MainController < ApplicationController
  def index
    flash[:notice] = "Logged in successfully!"
    flash[:alert] = "Invalid credentials!"
  end
end
