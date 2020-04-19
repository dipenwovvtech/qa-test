class Topic < ApplicationRecord

  has_many :questions

  validates :name, presence: true

  extend FriendlyId
  friendly_id :secure_slug, use: :slugged


  def secure_slug
    @random_slug ||=persisted? ? friendly_id: "#{Time.now.to_i}-#{name.parameterize}"
  end
end
