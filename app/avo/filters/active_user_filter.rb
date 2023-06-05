class ActiveUserFilter < Avo::Filters::BooleanFilter
  self.name = "Active user filter"
  # self.visible = -> do
  #   true
  # end

  def apply(request, query, values)
    query
  end

  def options
    {}
  end
end
