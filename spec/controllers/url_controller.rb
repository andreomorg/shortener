require 'rails_helper'

RSpec.describe UrlController, type: :controller do
  describe 'show' do
    it 'call' do
      get :show
      expect(response).to have_http_status(:ok)
    end
  end

  let(:original_url) { 'https://google.com' }
  let(:short_url) { 'http://bit.ly/3960e' }
  
  describe 'original_to_short' do
    context 'when a valid original url' do
      it 'then return a short url' do
        post 'original_to_short', :params => {:original_url => original_url}
        expect(response).to have_http_status(:ok)
        expect(response.body).to include('short_url')
      end
    end
  end

  describe 'short_to_original' do
    context 'when short url exist' do
      before do
        Url.create(original_url: original_url, short_url: short_url)
      end

      it 'then return a original URL' do
        post 'short_to_original', :params => {:short_url => short_url}
        expect(response).to have_http_status(:ok)
        expect(response.body).to include('original_url')
      end
    end

    context 'when short url doesnt exist' do
      it 'then return a unprocess entity' do
        post 'short_to_original', :params => {:short_url => short_url}
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to eq('{}')
      end
    end
  end
end
