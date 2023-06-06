class PostTitleFiler < Avo::Filters::TextFilter
  self.name = "Post title filer"
  self.button_label = 'Filter by post title filer'
  # self.visible = -> do
  #   true
  # end

  def apply(request, query, value)
    query
  end
end
