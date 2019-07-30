class Event < ApplicationRecord

  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  has_many :attendances
  has_many :attendees, through: :attendances

  scope :past, -> { Event.where("date < ?", Date.today) }
  scope :upcoming, -> { Event.where("date > ?", Date.today) }

end
