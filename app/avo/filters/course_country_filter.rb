class CourseCountryFilter < Avo::Filters::BooleanFilter
  self.name = "Course country filter"

  def apply(request, query, values)
    selected_countries = values.select { |country, selected| selected }.keys

    # Checks if the array of selected countries is empty
    if selected_countries.empty?
      # Returns the original query without applying the 'where' clause
      query
    else
      # Apply 'where' clause with selected countries
      query.where(country: selected_countries)
    end  end

  def options
    Course.countries.map { |country| [country, country] }.to_h
  end
end
