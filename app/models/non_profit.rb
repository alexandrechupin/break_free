class NonProfit < ApplicationRecord
  belongs_to :motive
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :contact_email, presence: true
  validates :logo_url, presence: true
end
