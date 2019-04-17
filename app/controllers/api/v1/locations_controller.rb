class Api::V1::LocationsController < Api::V1::BaseController
acts_as_token_authentication_handler_for User

 def index
   locations = policy_scope(Location)
   # @location.user = current_user
   @location = GeolocApiService.new.request_to_locationiq(params[:address])
   render json:@location
 end



 # def show
 #    @location = GeolocApiService.new.request_to_locationiq(params[:address])
 #     render json:@location
 #     # , status: 404)
 #  end




end
