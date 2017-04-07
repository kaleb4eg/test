class Api::Rest::BaseRestApiController < ApplicationController
  respond_to :json

  rescue_from StandardError, with: :render_500
  rescue_from ArgumentError, with: :render_400
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  private

  def render_400(exception)
    render json: { errors: [exception.message] }, status: 400
  end

  def render_404(exception)
    render json: { errors: [exception.message] }, status: 404
  end

  def render_500(exception)
    render json: { errors: [exception.message] }, status: 500
  end
end
