class FoodsController < ApplicationController

  def index
    require "pry"; binding.pry
  end

  private

  def food_search_params
    params.permit(:q)
  end
end
