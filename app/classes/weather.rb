class Weather
  attr_accessor :main, :description, :temp, :pressure, :humidity, :wind, :clouds

  def initialize(options={})
    if options['weather'].present?
      @main = options['weather']['main']
      @description = options['weather']['description']
    end
    @temp = {'normal'=> options['temp'], 'max'=> options['temp_max'], 'min' => options['temp_min']}
    @pressure = {'normal' => options['pressure'], 'sea_level' => options['sea_level'], 'grnd_level' => options['grnd_level']}
    @humidity = options['humidity']
    @wind = options['wind']
    @clouds = options['clouds']
  end
end