class FoodsController < ApplicationController

  def index
    render locals: {
      facade: FoodFacade.new(food_search_params[:q])
    }
  end

  private

  def food_search_params
    params.permit(:q)
  end
end
