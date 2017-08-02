class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :dollar_amount, presence: true
  validates :user, presence: true
  validate :owner_cannot_pledge
  validates :owner, presence: false

  def owner_cannot_pledge
    if self.user == project.owner
      errors.add(:user, 'Owner should not be able to pledge towards own project')
    end
  end

end
