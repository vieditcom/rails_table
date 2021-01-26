class User < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3, maximum: 100}
  validates :email, presence: true, email: true, uniqueness: true
  validates :phone, phone: true, presence: true

  scope :search, ->(query) {
    query = sanitize_sql_like(query)
    where(arel_table[:name].matches("%#{query}%"))
      .or(where(arel_table[:email].matches("%#{query}%")))
      .or(where(arel_table[:phone].matches("%#{query}%")))
  }

end
