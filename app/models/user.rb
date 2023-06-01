class User < ApplicationRecord
  has_many :posts
  has_many :comments

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at email id name updated_at]
  end
end
