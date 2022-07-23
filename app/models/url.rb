class Url < ApplicationRecord
  validate :original_url, :short_url, :original_url_formated?

  private

  def original_url_formated?
    url = URI.parse(original_url)
    errors.add(:original_url, message: 'Invalid URL') if url.host.nil?
  end
end
