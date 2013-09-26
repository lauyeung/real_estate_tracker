class Tenant < ActiveRecord::Base

  belongs_to :building,
    inverse_of: :tenants

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :building

  class << self

    def sorted
      if Tenant.count > 0
        @sorted_tenants = Tenant.order(:first_name).order(:last_name)
      else
        @sorted_tenants = []
      end
    end

  end


end
