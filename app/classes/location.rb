#Author: Annu Yadav
#Date: July 19, 2017

class Location
  attr_accessor :city, :country, :latitude, :longitude, :weather, :error

  def initialize(query)
    @info = fetch_info(query)
    report_error
  end

  def update_info
    @weather = Weather.new(@info['main'].merge({'wind' => @info['wind'], 'clouds' => @info['clouds'], 'weather' => @info['weather'].try(:first)}))
    @city = @info['name']
    @country = @info['sys']['country']
    @latitude = @info['coord']['lat']
    @longitude = @info['coord']['lon']
  end

  def fetch_info(query)
    _info = Rails.cache.read(query)
    p "==============    _info  :  #{_info}   ===  #{query}"
    if _info.blank?
      _query_with_key = query + "&appid=#{WEATHER_APP['api_key']}"
      _url = [WEATHER_APP['url'], _query_with_key].join('?')
      p "==============    _url  :  #{_url}"
      response = HTTParty.get(_url)
      _info = JSON.parse(response.body)
      Rails.cache.write(query, _info)
    end
    _info
  end

  def report_error
    @error = {}
    if !@info['cod'].to_s.match(/^20\d/)
      @error['code'] = @info['cod']
      @error['message'] = @info['message']
    end
  end

  def error?
    !@error.blank?
  end
end