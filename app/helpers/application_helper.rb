module ApplicationHelper
    def current_city
    @current_city ||= City.find(session[:city_id])
  end
end
