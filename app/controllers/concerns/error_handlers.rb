module ErrorHandlers
  extend ActiveSupport::Concern

  def render_not_found(e)
    data = {meta: {message: e.message}}
    render json: data, status: :not_found
  end

  def render_unprocessable_entity(e)
    data = {meta: {message: e.message}}
    render json: data, status: :unprocessable_entity
  end

  def render_not_acceptable(e)
    data = {meta: {message: e.message}}
    render json: data, status: :not_acceptable
  end

  def render_bad_request(e)
    data = {meta: {message: e.message}}
    render json: data, status: :bad_request
  end

  def render_forbidden(e)
    data = {meta: {message: e.message}}
    render json: data, status: :forbidden
  end
end