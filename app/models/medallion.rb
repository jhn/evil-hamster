class Medallion
  include Mongoid::Document

  field :license_number, type: Integer
  field :name, type: String
  field :type, type: String
  field :expiration_date, type: Date
  field :last_date_updated, type: Date
  field :last_time_updated, type: Time

end
