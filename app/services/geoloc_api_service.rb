require 'net/http'
class GeolocApiService

  def request_to_locationiq(user_string)

    full_url = URI::HTTP.build(:host => 'eu1.locationiq.com',
    :path => '/v1/search.php',
    :query => "key=#{ENV['LOCATIONIQ_API_KEY']}=#{user_string}&format=json")

    puts "Doing request to: #{full_url.to_s}"

    response = Net::HTTP.get_response(full_url)
      case response.code
        when "404"
          result = 1
        when "400"
          result = 2
        when "429"
          result = 3
        when "500"
          result = 4
        else
          parser = JSON.parse(response.body)
          location = {lat: parser[0]['lat'], lon: parser[0]['lon']}
          result = location.to_json
      end
  end
end


# response = Api.new.request_to_locationiq("ulhandstrasse 167")
# puts "\nResponse is: #{response}"

# response = Api.new.request_to_locationiq("zzzzzzzzzzzz")
# puts "\nResponse is: #{response}"


# response = Api.new.request_to_locationiq("")
# puts "\nResponse is: #{response}"




