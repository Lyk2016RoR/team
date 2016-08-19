class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]


  def show
    @profile = User.find params[:id]

  end

  private

  def set_profile
    @profile = current_user
  end
end
