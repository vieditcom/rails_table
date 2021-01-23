class User < ApplicationRecord
  validates :name, :email, :phone, presence: true
  validates :email, uniqueness: true

  scope :search, ->(query) {
    query = sanitize_sql_like(query)
    where(arel_table[:name].matches("%#{query}%"))
      .or(where(arel_table[:email].matches("%#{query}%")))
      .or(where(arel_table[:phone].matches("%#{query}%")))
  }

end
