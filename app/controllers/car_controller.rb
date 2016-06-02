class CarController < ApplicationController
  def create_car
    if params.has_key?(:make) && params.has_key?(:year)
      if params[:make].strip.empty? || params[:year].strip.empty?
        redirect_to '/'
      else
        new_car = Car.new(params[:make], params[:year], params[:user_color])
        cookies[:car] = new_car.to_yaml
        @car = YAML.load(cookies[:car])
        cookies[:lights] = 'On'
        render 'create_car.html.erb'
      end
    else
      redirect_to '/'
    end
  end

  def repaint_car
    @car = YAML.load(cookies[:car])
    @car.change_color(params[:user_color])
    cookies[:car] = @car.to_yaml
    render 'create_car.html.erb'
  end

  def accelerate
    @car = YAML.load(cookies[:car])
    @car.accelerate
    cookies[:car] = @car.to_yaml
    render 'create_car.html.erb'
  end

  def brake
    @car = YAML.load(cookies[:car])
    @car.brake
    cookies[:car] = @car.to_yaml
    render 'create_car.html.erb'
  end

  def toggle_lights
    @car = YAML.load(cookies[:car])
    @car.toggle_lights
    cookies[:car] = @car.to_yaml
    if @car.get_lights
      cookies[:lights] = 'Off'
    else
      cookies[:lights] = 'On'
    end
    render 'create_car.html.erb'
  end

  def parking_brake
    @car = YAML.load(cookies[:car])
    if params.has_key?(:parking)
      if !params[:parking].empty?
        @car.parking_brake(params[:parking])
        cookies[:car] = @car.to_yaml
      end
    end
    render 'create_car.html.erb'
  end



end
