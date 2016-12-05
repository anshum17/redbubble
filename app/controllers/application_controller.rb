class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_params values
    values.each do |x|
      if params[x].blank?
        return false
      end
    end
    return true
  end
end
