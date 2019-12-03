require 'will_paginate/array'

class Api::V1::ApiController < ActionController::API
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def save_and_render(obj, options = {})
    if obj.save
      render_ok(obj, options)
    else
      render json: { errors: obj.errors.messages }, status: :unprocessable_entity
    end
  end

  def render_ok(obj, options = {})
    options = { status: :ok }.merge(options)
    render({ json: obj }.merge(options))
  end

  def record_not_found(exception)
    render json: { errors: exception.message }, status: :unprocessable_entity
  end

  def paginate_and_render(collection)
    render_ok collection.paginate(page: params[:page] || 1, per_page: params[:per_page] || 20)
  end
end