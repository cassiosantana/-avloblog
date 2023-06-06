class CourseCityFilter < Avo::Filters::BooleanFilter
  self.name = "Course city filter"
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
