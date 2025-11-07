class CreateEmployeeDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :employee_details do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :designation, null: false
      t.references :department, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
