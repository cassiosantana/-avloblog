class ActiveUserSelectFilter < Avo::Filters::SelectFilter
  self.name = "Active user select filter"
  # self.visible = -> do
  #   true
  # end

  def apply(request, query, value)
    case value
    when "Active"
      query.where(active: true)
    when "Inactive"
      query.where(active: false)
    else
      query
    end
  end

  def options
    {
      "Active": "Active",
      "Inactive": "Inactive"
    }
  end
end
