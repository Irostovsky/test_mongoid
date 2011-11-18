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
    latitude = params[:latitude]
    longitude = params[:longitude]
    @offices = end_of_association_chain.near_by(latitude, longitude, {:remote_ip => request.remote_ip}).page(params[:page])
  end


  #########
  protected
  #########
  def collection
    latitude = cookies[:latitude]
    longitude = cookies[:longitude]
    
    @cookie_set = true if latitude && longitude
    @offices = end_of_association_chain.near_by(latitude, longitude, {:remote_ip => request.remote_ip}).page(params[:page])
  end

end

class Office
  
  def self.near_by latitude, longitude, opts={}
    by_param(latitude, longitude) || by_ip(latitude, longitude, opts) || by_default
  end
  
  def self.by_param longitude, latitude
    near([latitude.to_f, longitude.to_f], 6) if latitude && longitude
  end
  
  def self.by_ip longitude, latitude, opts
    latitude, longitude = get_ip_based_location opts[:remote_ip]
    near([latitude, longitude], 6)
  end

  def self.by_default
    latitude = 43.653419
    longitude = -79.383988
    near([latitude, longitude], 6)
  end
  
  def self.get_ip_based_location remote_ip
    current_user_location = IPLocator.lookup remote_ip
    [current_user_location.latitude, current_user_location.longitude] if current_user_location  
  end
  
end