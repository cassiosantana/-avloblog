class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user

  def self.ransackable_attributes(auth_object = nil)
    %w[body category_id created_at id tittle updated_at user_id]
  end

  def excerpt
    ActionView::Base.full_sanitizer.sanitize(body).truncate 30
  end
end
