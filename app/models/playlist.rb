class Playlist
  include Mongoid::Document
  include Mongoid::Slug

  field :title, type: String
  field :public, type: Boolean, default: false
  alias :public? :public

  slug :title

  has_many :tracks, dependent: :destroy

  belongs_to :user

  validates :title, presence: true
end
