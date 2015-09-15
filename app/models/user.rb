class User
  include Mongoid::Document

  field :first_name,   :type => String
  field :last_name,    :type => String
  field :age,          :type => Integer
  field :email,        :type => String
  field :phone_number, :type => String
  field :birthday,     :type => String

end
