require 'rest_client'
require 'json'
require 'logger'
require 'time'
require 'time_difference'

require_relative 'broadcast'

class DabSync
  def logger
    @logger ||= Logger.new 'log.txt'
  end

  # Returns an array of Broadcast objects that will start in a specific minute
  # - broadcasts: array of Broadcast objects
  # - time: Time object
  def get_broadcasts_for_minute broadcasts, time
    broadcasts.collect { |b| TimeDifference.between( b.start, time).in_minutes < 1 }
  end

  # Returns an array of broadbasts as parsed from the given uri
  # - uri: The uri of the service for json format, such as: http://www.bbc.co.uk/worldserviceradio/programmes/schedules/2011/05/18.json
  def get_broadcasts uri
    begin
      response = RestClient.get(uri)
      broadcasts = []
      JSON.parse(response)['schedule']['day']['broadcasts'].each do |json|
        broadcasts << Broadcast.new(json['programme']['display_titles']['title'],
                                    json['programme']['display_titles']['subtitle'],
                                    Time.parse(json['start']),
                                    json['pid'])
      end
      return broadcasts
    rescue => e
      logger.error e.response
    end
  end

end