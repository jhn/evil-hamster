class Track
  include Mongoid::Document

  belongs_to :playlist

  field :title, type: String
  field :artist, type: String
  field :link, type: String
end
