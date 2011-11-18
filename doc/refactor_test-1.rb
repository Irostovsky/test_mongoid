class OfficesController < InheritedResources::Base
  # NOTE: This application uses InheritedResources
  # What is happening below:
  # We require a list of near by offices (within 6 miles) of a long/lat location
  # Location can be obtained 3 different ways: [Order of lookup is important]
  # 1) Location is sent via params
  # 2) Location is gotten using IP and lookup an IP database (get_ip_based_location)
  # 3) Default to a specific location (get_city_hall_offices)
  # 
  # No need to worry about the rendering, just that @offices should return a list of near by offices
  # 
  # Task: Refactor this code to a cleaner and easier ot read code.
  # _IF_ you need ot move something into the office model, add it to the Office class at the bottom
  # of this file. 
  
  
  def getoffices
    generate_offices
  end

  def generate_offices
    @latitude = params[:latitude]
    @longitude = params[:longitude]
    @offices = end_of_association_chain
    # If the posted location is empty, find the location by ip address
    if @latitude.empty? or @longitude.empty?
      get_ip_based_location
      @offices = @offices.near([@latitude, @longitude], 6)
    else
      @offices = @offices.near([@latitude.to_f, @longitude.to_f], 6)
    end
    get_city_hall_offices
    @offices = @offices.page(params[:page])
  end


  #########
  protected
  #########
  def collection
    @offices = end_of_association_chain
    @latitude = cookies[:latitude]
    @longitude = cookies[:longitude]
    if @latitude.nil? or @longitude.nil?
      get_ip_based_location
      @offices = @offices.near([@latitude, @longitude], 6)
    else
      @cookie_set = true
      @offices = @offices.near([@latitude.to_f, @longitude.to_f], 6)
    end

    get_city_hall_offices    
    @offices = @offices.page(params[:page])
  end


  def get_ip_based_location
    @latitude = current_user_location.latitude unless current_user_location.nil?
    @longitude = current_user_location.longitude unless current_user_location.nil?
  end
  
  def current_user_location
    #Don't worry about the source for IPLocator, assume it returns an object with IPLocator#latitude and IPLocator#longitude or nil
    @current_user_location ||= IPLocator.lookup(request.remote_ip)
  end

  def get_city_hall_offices
    if @offices.nil? or @offices.empty?
      @offices = end_of_association_chain
      @latitude = 43.653419
      @longitude = -79.383988
      @offices = @offices.near([@latitude,@longitude], 6)
    end
  end
end

class Office
  # _IF_ You need ot move anything into the office class, just add it down here.
end