module ApplicationHelper
  def current_city
    @current_city ||= City.find(session[:city_id]) if session[:city_id]
  end

  def current_studio
    @current_studio ||= Studio.find(session[:studio_id]) if session[:studio_id]
  end
end
