class Rating < ActiveRecord::Base

  validates :book_id, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :rate, presence: true, numericality: {
                                    only_integer: true,
                                    greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 10
                                }
  validates :book_id, uniqueness: { scope: :email }

  belongs_to :book
end
