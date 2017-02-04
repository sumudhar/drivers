class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render body: nil, status: 404
  end
end
