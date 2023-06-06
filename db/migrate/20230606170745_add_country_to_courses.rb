class AddCountryToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :country, :string
  end
end
