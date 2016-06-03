class Car
  def initialize (make, year, color)
    @make = make
    @year = year
    @color = color
    @speed = 0
    @lights_on = false
    @parking_brake = 'On'
    @light_button = 'On'
  end

  def get_make
    @make
  end

  def get_year
    @year
  end

  def get_color
    @color
  end

  def get_lights
    @lights_on
  end

  def get_light_button
    @light_button
  end

  def change_light_button(light_button)
    @light_button = light_button
  end

  def get_speed
    @speed
  end

  def change_color(color)
    @color = color
  end

  def accelerate
    if @parking_brake == 'Off'
       @speed += 10
    end
  end

  def brake
    if @speed > 6
      @speed -= 7
    else
      @speed = 0
    end
  end

  def toggle_lights
    @lights_on = !@lights_on
  end

  def get_parking_brake
    @parking_brake
  end

  def parking_brake(brake)
    if @speed <= 0
      @parking_brake = brake
    end
  end


end
