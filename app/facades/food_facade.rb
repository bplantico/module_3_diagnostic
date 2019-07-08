class FoodFacade
  attr_reader :food

  def initialize(food)
    @food = food
  end

  def results
    require "pry"; binding.pry
    results = data_service.food_search_results
  end

  private

  def data_service
    DataService.new(@food)
  end
end
