class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions
  has_many :answers

  # allow to be followed acts_as_followable
  acts_as_followable

  # can follow other models acts_as_follower
  acts_as_follower

  validates :name, presence: true

  extend FriendlyId
  friendly_id :secure_slug, use: :slugged


  def secure_slug
    @random_slug ||=persisted? ? friendly_id: "#{Time.now.to_i}-#{name.parameterize}"
  end
end
