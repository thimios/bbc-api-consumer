#!/usr/bin/env ruby

require_relative 'lib/dab_sync'
require 'time'
require 'time_difference'


RADIO2_URI = 'http://www.bbc.co.uk/radio2/programmes/schedules/%s.json'
RADIO5_LIVE_SPORTS_EXTRA_URI = 'http://www.bbc.co.uk/5livesportsextra/programmes/schedules/%s.json'
WORLD_SERVICE_URI = 'http://www.bbc.co.uk/worldserviceradio/programmes/schedules/%s.json'

# Get today's broadcasts

dab_sync = DabSync.new
#TODO make sure that we use the proper date, UTC does not adjust daylight savings time
radio2_broadcasts = dab_sync.get_broadcasts RADIO2_URI % [Time.now.utc.strftime("%Y/%m/%d")]
radio5_broadcasts = dab_sync.get_broadcasts RADIO5_LIVE_SPORTS_EXTRA_URI % [Time.now.utc.strftime("%Y/%m/%d")]
world_service_broadcasts = dab_sync.get_broadcasts WORLD_SERVICE_URI % [Time.now.utc.strftime("%Y/%m/%d")]


while true do
  # check if it is time to get broadcasts for the next day

  # send on air now for shows started on the current minute and remove them from the array

  # send on air next for shows starting in 1, 2, 3, 5, 10 minutes

  # run every minute
  sleep 60
end

