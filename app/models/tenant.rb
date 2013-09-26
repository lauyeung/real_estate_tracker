class Tenant < ActiveRecord::Base

  belongs_to :building,
    inverse_of: :tenants

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :building


end
