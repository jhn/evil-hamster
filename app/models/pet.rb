class Pet
  include Mongoid::Document

  embedded_in :user

  field :name, type: String
  field :age, type: Integer
  field :date_of_birth, type: Date
end
