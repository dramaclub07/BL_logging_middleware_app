class HomeController < ApplicationController
  def index
    render json: { message: 'Hello, World! Welcome to the API' }
  end
end
