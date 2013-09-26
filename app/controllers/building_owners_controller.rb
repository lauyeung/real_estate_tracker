class BuildingOwnersController < ApplicationController

  def new
    @building_owner = BuildingOwner.new
  end

  def create
    @building_owner = BuildingOwner.new(building_owner_params)

    if @building_owner.save
      redirect_to new_building_owner_path, notice: 'Building owner recorded.'
    else
      render :new
    end
  end

  protected

  def building_owner_params
    params.require(:building_owner).permit(:first_name, :last_name, :email, :company_name)
  end
end
