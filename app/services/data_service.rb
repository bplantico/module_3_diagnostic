class DataService
  def initialize(user_token)
    @user_token = user_token
  end

  def food_search_results
    get_json('/search')
  end

  private

  def get_json(params = {})
    require "pry"; binding.pry
    response = conn.get(params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.nal.usda.gov/ndb/search/') do |f|
      f.params['api_key'] = ENV['DATA_GOV_API_KEY']
      f.params['format'] = 'json'
      f.adapter Faraday.default_adapter
    end
  end
end
