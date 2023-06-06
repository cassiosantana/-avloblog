class AddCityToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :city, :string
  end
end
