class UrlController < ApplicationController
  def show
    render json: Url.all
  end

  def original_to_short
    if create_short_url.errors.present?
      render json: create_short_url.errors.messages, status: :bad_request
    else
      render json: {short_url: create_short_url.short_url}, status: :ok
    end
  end

  def short_to_original
    url = Url.find_by(short_url: url_params[:short_url])
    if url
      render json: {original_url: url.original_url}, status: :ok
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  private


  def url_params
    params.permit(:original_url, :short_url)
  end

  def create_short_url
    @short_url ||= ShortenerService.new(
      original_url: url_params[:original_url]
    ).call
  end
end
