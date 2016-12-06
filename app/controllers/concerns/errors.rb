module Errors
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    rescue_from ActiveRecord::RecordInvalid, :with => :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotSaved, :with => :render_unprocessable_entity
    rescue_from ActiveRecord::DeleteRestrictionError, :with => :render_not_acceptable
    rescue_from ActiveRecord::RecordNotDestroyed, :with => :render_not_acceptable
    rescue_from ActionController::ParameterMissing, :with => :render_bad_request
    rescue_from ActionController::ActionControllerError, :with => :render_bad_request
  end
end