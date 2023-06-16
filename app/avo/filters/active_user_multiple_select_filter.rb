class ActiveUserMultipleSelectFilter < Avo::Filters::MultipleSelectFilter
  self.name = "Active user multiple select filter"
  # self.visible = -> do
  #   true
  # end

  def apply(request, query, value)
    if value.include? "active"
      query = query.where(active: true)
    end

    if value.include? "inactive"
      query = query.where(active: false)
    end

    query
  end

  def options
    {
      active: "Active",
      inactive: "Inactive"
    }
  end
end
