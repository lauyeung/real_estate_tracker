class BuildingOwner < ActiveRecord::Base
  has_many :buildings,
    inverse_of: :building_owner,
    dependent: :nullify

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email

end
