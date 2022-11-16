require 'date'
require 'json'

class TimeError
  # Returns difference in seconds between server time
  # and the time on this computer
  def initialize(requester)
    @requester = requester
  end

  def error(current_time)
    return get_server_time - current_time
  end

  private

  def get_server_time
    text_response = @requester.get(URI("https://worldtimeapi.org/api/ip"))
    json = JSON.parse(text_response)
    return DateTime.parse(json["utc_datetime"]).to_time
  end
end

# Example for "utc_datetime":
#     { "utc_datetime":"2022-11-16T16:29:00.362990+00:00" }

