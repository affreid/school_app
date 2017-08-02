class AddHeroToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :hero, :string
  end
end
