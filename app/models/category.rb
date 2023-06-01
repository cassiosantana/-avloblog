class Category < ApplicationRecord
  has_many :posts

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at description id title updated_at]
  end
end
