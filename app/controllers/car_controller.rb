class CarController < ApplicationController
  def create_car
    #if user calls the method and sends parameters
    if params.has_key?(:make) && params.has_key?(:year)
      #if user calls the method and sends parameters with no values
      if params[:make].strip.empty? || params[:year].strip.empty?
        #redirect to the root directory
        redirect_to '/'
        #if user calls the method and sends valid parameters
      else
        #create a new car class object using the parameters sent by the browser and store it in a variable
        new_car = Car.new(params[:make], params[:year], params[:user_color])
        #store the car object in a cookie as a yaml string
        cookies[:car] = new_car.to_yaml
        #get yaml string from cookie and convert it back to an object and store it in the @car instance variable
        @car = YAML.load(cookies[:car])
        render 'create_car.html.erb'
      end
      #if user calls the method and doesn't send parameters
    else
      #redirect to the root directory
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
    if @car.get_lights
      @car.change_light_button('Off')
    else
      @car.change_light_button('On')
    end
    cookies[:car] = @car.to_yaml
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
