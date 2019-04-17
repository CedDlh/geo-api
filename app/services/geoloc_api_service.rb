require 'net/http'
# require "json"

class GeolocApiService

  def request_to_locationiq(user_string)

    full_url = URI::HTTP.build(:host => 'eu1.locationiq.com',
    :path => '/v1/search.php',
    :query => "key=84a08a09c6edcb&q=#{user_string}&format=json")

    puts "Doing request to: #{full_url.to_s}"

    request = Net::HTTP.get_response(full_url)
      if request.code == "404"
        # raise NotFoundException
        result = "No location or places were found for the given input"
      elsif request.code == "400"
        result = "Required parameters are missing, or invalid"
      elsif request.code == "429"
        result = "Request exceeded the per-second rate-limits set on your account"
      else
        parser = JSON.parse(request.body)
        location = {lat: parser[0]['lat'], lon: parser[0]['lon']}
        result = location.to_json
        # result = "lattitude = #{parser[0]['lat']} - longitude = #{parser[0]['lon']}"
      end
    # p result
  end
end


# response = Api.new.request_to_locationiq("ulhandstrasse 167")
# puts "\nResponse is: #{response}"

# response = Api.new.request_to_locationiq("zzzzzzzzzzzz")
# puts "\nResponse is: #{response}"


# response = Api.new.request_to_locationiq("")
# puts "\nResponse is: #{response}"




