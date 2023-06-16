class AuthorPostsFilter < Avo::Filters::SelectFilter
  self.name = "Filter by Author"
  # self.visible = -> do
  #   true
  # end

  def apply(request, query, value)
    query = query.where(user_id: value) if value.present?
    query
  end

  def options
    User.select(:id, :name).each_with_object({}) { |user, options| options[user.id] = user.name }
  end
end
