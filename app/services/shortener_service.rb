class ShortenerService
  def initialize(original_url:, url_model: Url)
    @original_url = original_url
    @url_model = url_model
  end

  def call
    short_url
  end

  private

  def short_url
    @url_model.create(
      original_url: @original_url, 
      short_url: mount_short_url
    )
  end

  private

  def mount_short_url
    "http://bit.ly/#{SecureRandom.uuid[0..4]}"
  end
end