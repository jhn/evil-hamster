class User
  include Mongoid::Document
  include Mongoid::Slug

  has_many :playlists, dependent: :destroy

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :github, type: String
  field :linkedin, type: String

  mount_uploader :avatar, AvatarUploader

  slug do |cur_object|
    cur_object.email
  end

  def public_playlists
    playlists.select(&:public?)
  end

  def private_playlists
    playlists.reject(&:public?)
  end
end
