class OfficesController < InheritedResources::Base
  def getoffices
    latitude = params[:latitude]
    longitude = params[:longitude]
    @offices = end_of_association_chain.near_by(latitude, longitude, {:remote_ip => request.remote_ip}).page(params[:page])
  end

protected

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