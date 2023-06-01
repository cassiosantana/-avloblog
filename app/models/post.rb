class Post < ApplicationRecord
  belongs_to :category

  def excerpt
    body.truncate 30
  end
end
