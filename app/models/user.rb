class User
  include Mongoid::Document

  embeds_many :pets
  belongs_to :spaceShip

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
end
