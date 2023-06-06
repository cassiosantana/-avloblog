class AuthorPostsFilter < Avo::Filters::SelectFilter
  self.name = "Author posts filter"
  # self.visible = -> do
  #   true
  # end

  def apply(request, query, value)
    query
  end

  def options
    {}
  end
end
