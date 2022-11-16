require "time_error"

RSpec.describe TimeError do
  it "error returns the time error between 01:02:03.1 and 00:00:00 - 01/01/22 (3723)" do
    requester_double = double(:requester)
    # We expect requester_double.get to be called
    # We want the get response to contain a json object with
    #  the "utc_datetime" key
    expect(requester_double).to receive(:get)
      .with(URI("https://worldtimeapi.org/api/ip"))
      .and_return('{ "utc_datetime":"2022-01-01T01:02:03.1+00:00" }')

    # Setup the TimeError class
    time_error = TimeError.new(requester_double)
    time = Time.new(2022, 1, 1, 0, 0, 0)
    expect(time_error.error(time)).to eq 3723.1
  end
end


# Example for "utc_datetime":
#     { "utc_datetime":"2022-11-16T16:29:00.362990+00:00" }

# The "utc_datetime" for 00:00:00 01/01/22 would be:
#     { "utc_datetime":"2022-01-01T00:00:00+00:00" }