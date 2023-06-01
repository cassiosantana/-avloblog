class Post < ApplicationRecord
  def excerpt
    body.truncate 30
  end
end
