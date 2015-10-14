class Medallion
  include Mongoid::Document

  field :license_number, type: Integer
  field :name, type: String
  field :type, type: String
  field :expiration_date, type: Date
  field :last_date_updated, type: Date
  field :last_time_updated, type: Time

  validates :name, length: { minimum: 1 } # should contain at least 1 character
  validates :type, inclusion: { in: ["MEDALLION TAXI DRIVER"] } # should be of a specific type
  validates :expiration_date, presence: true # should expire
end
