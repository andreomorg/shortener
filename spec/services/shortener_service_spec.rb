require 'rails_helper'

RSpec.describe ShortenerService, type: :unit do
  subject(:service) { described_class.new(
    original_url: original_url
  ) }

  describe '#call' do
    context 'when url is valid' do
      let(:original_url) { 'https://google.com' }
      it 'then generate a short url' do
        expect(subject.call.short_url.length) == 19
      end

      it 'then do not generate equals short url for a same original url' do
        first_short = subject.call.short_url
        second_short = subject.call.short_url

        expect(first_short).not_to equal(second_short)
      end
    end
  end
end