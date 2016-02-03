class ProfilesController < ApplicationController
  before_action :check_authorized
  
  def create
    @profile = Profile.new(profile_params)
    @profile.account = @authorized_account
    respond_to do |wants|
      if(@profile.save)
        wants.js {  }
      else
        wants.js { render partial: 'errors', locals: {errors: @profile.errors} }
      end
    end
  end
  
  private
  
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone_number)
  end
end
