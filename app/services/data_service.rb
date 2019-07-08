class DataService
  def initialize(food)
    @food = food
  end

  def food_search_results
    get_json('/search/', @food)
  end

  private

  def get_json(url, params = {})
    response = conn.get(params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.nal.usda.gov/ndb/') do |f|
      f.params['api_key'] = ENV['DATA_GOV_API_KEY']
      f.params['format'] = 'json'
      f.params['q'] = "#{@food}"
      f.adapter Faraday.default_adapter
    end
  end
end
