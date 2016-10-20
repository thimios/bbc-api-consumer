require_relative '../lib/broadcast'
require_relative '../lib/dab_sync'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end

describe DabSync do
  let (:broadcasts) do
    broadcasts = []
    10.times do
      broadcasts << Broadcast.new( 'title', 'subtitle', Time.now, 'pid')
    end
    broadcasts
  end

  describe '#get_broadcasts_for_minute' do
    it 'returns an array' do
      expect(DabSync.new.get_broadcasts_for_minute( broadcasts, Time.now).count).to eq(10)
    end
  end

  describe '#get_broadcasts' do
    it 'parses broadcasts' do
      VCR.use_cassette('radio2') do
        broadcasts = DabSync.new.get_broadcasts "http://www.bbc.co.uk/radio2/programmes/schedules/2014/11/03.json"
        expect(broadcasts.count).to eq(15)
      end
    end
  end
end
