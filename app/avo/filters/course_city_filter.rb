class CourseCityFilter < Avo::Filters::BooleanFilter
  self.name = "Course city filter"

  def apply(request, query, values)
    query.where(city: values.select { |city, selected| selected }.keys)
  end

  def options
    cities_for_countries countries
  end

  def react
    # Check if the user selected a country
    if applied_filters["CourseCountryFilter"].present? && applied_filters["CourseCityFilter"].blank?
      # Get the selected countries, get their cities, and select the first one.
      selected_countries = applied_filters["CourseCountryFilter"].select do |name, selected|
        selected
      end

      # Get the first city
      cities = cities_for_countries(selected_countries.keys)
      first_city = cities.first.first

      # Return the first city as selected
      [[first_city, true]].to_h
    end
  end

  private

  # Get a hash of cities for certain countries
  # Example payload:
  # countries = ["USA", "Japan"]
  def cities_for_countries(countries_array = [])
    countries_array
      .map do |country|
      # Get the cities for this country
      Course.cities.stringify_keys[country]
    end
      .flatten
      # Prepare to transform to a Hash
      .map { |city| [city, city] }
      # Turn to a Hash
      .to_h
  end

  # Get the value of the selected countries
  # Example payload:
  # applied_filters = {
  #   "CourseCountryFilter" => {
  #     "USA" => true,
  #     "Japan" => true,
  #     "Spain" => false,
  #     "Thailand" => false,
  #   }
  # }
  def countries
    if applied_filters["CourseCountryFilter"].present?
      # Fetch the value of the countries filter
      applied_filters["CourseCountryFilter"]
      # Keep only the ones selected
        .select { |country, selected| selected }
        # Pluck the name of the country
        .keys
    else
      # Return empty array
      []
    end
  end
end
