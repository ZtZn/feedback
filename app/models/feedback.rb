class Feedback < ApplicationRecord
  paginates_per 10

  belongs_to :user, optional: true

  validates :name, presence: true
  validates :email, presence: true
  validates :text, presence: true

  def self.search(search)
    if search
      where("text ilike ? OR name ilike ?", "%#{search}%", "%#{search}%")
    else
      order("id DESC")
    end
  end
end
