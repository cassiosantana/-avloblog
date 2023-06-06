class PostTitleFiler < Avo::Filters::TextFilter
  self.name = "Post title filer"
  self.button_label = 'Filter by post title'
  # self.visible = -> do
  #   true
  # end

  def apply(request, query, value)
    query.where('LOWER(tittle) LIKE ?', "%#{value}%")
  end
end
