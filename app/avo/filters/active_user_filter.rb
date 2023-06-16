class ActiveUserFilter < Avo::Filters::BooleanFilter
  self.name = "Active user filter"
  # self.visible = -> do
  #   true
  # end

  def apply(request, query, values)
    return query if values['Active'] && values['Inactive']

    if values['Active']
      query = query.where(active: true)
    elsif values['Inactive']
      query = query.where(active: false)
    end

    query
  end


  def options
    {
      "Active": "Active",
      "Inactive": "Inactive"
    }
  end
end
