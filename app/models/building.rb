class Building < ActiveRecord::Base
  belongs_to :building_owner,
    inverse_of: :buildings

  has_many :tenants,
    inverse_of: :building,
    dependent: :destroy

  STATES = %w{AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY}

  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :postal_code

  validates_inclusion_of :state, in: STATES

  def full_address
    "#{street_address}, #{city}, #{state}, #{postal_code}"
  end

end
