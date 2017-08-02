class AddPaidInFullToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :paid_in_full, :boolean, default: false
  end
end
