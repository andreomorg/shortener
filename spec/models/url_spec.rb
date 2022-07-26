require 'rails_helper'

RSpec.describe Url, type: :model do

  let(:original_url) {'https://google.com'}

  describe 'when is a valid URL' do
    context 'with original url and short url' do
      it 'then create URL' do
        url = Url.new(
          original_url: original_url,
          short_url: 'http://bit.ly/1304c'
        )

        expect(url.valid?).to be(true)
      end
    end
  end

  describe 'when is a invalid URL' do
    context 'with invalid original url' do
      it 'then dont create URL' do
        url = Url.new(
          original_url: 'asdasd'
        )

        expect(url.valid?).to be(false)
        expect(url.save).to be(false)
      end
    end

    context 'with blank short url' do
      it 'then dont create URL' do
        url = Url.create(
          original_url: original_url
        )

        expect(url.valid?).to be(false)
        expect(url.save).to be(false)
      end
    end
  end
end