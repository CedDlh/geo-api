class Api::V1::LocationsController < Api::V1::BaseController
acts_as_token_authentication_handler_for User

  def index
    locations = policy_scope(Location)
    @location = GeolocApiService.new.request_to_locationiq(params[:address])
    if @location == 1
      render(json: "No location or places were found for the given
             input", status:404)
    elsif @location == 2
      render(json: "Required parameters are missing, or invalid",
             status:400)
    elsif @location == 3
      render(json: "Request exceeded the per-second rate-limits set on
             your account", status:429)
    elsif @location == 4
      render(json: "This is an error on the server's side,
             we monitor this 24x7 and you should try again.", status:500)
    else
      render json: @location
    end
  end
end
