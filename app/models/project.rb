class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :backers, through: :pledges, source: :user
  belongs_to :owner, class_name: 'User'

  validates :title, :description, :goal, :owner_id, :start_date, :end_date, presence: true
  validate :start_date_not_in_past
  validate :end_date_must_be_later_than_start_date

  def start_date_not_in_past
    if self.start_date < Time.now
      errors.add(:start_date, 'Time cannot be set in the past.')
    end
  end

  def end_date_must_be_later_than_start_date
    if self.start_date >= self.end_date
      errors.add(:start_date, 'End date must be after start date.')
    end
  end

  


end
