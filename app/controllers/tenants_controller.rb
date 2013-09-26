class TenantsController < ApplicationController

  def new
    @tenant = Tenant.new
  end

  def create
    @tenant = Tenant.new(tenant_params)

    if @tenant.save
      redirect_to new_tenant_path, notice: 'Tenant added.'
    else
      render :new
    end
  end

  def index
    @tenants = Tenant.all.sorted
  end

  protected

  def tenant_params
    params.require(:tenant).permit(:first_name, :last_name, :email, :building_id)
  end
end
