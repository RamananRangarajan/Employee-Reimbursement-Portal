class CreateBills < ActiveRecord::Migration[7.1]
  def change
    create_table :bills do |t|
      t.decimal :amount, null: false, precision: 10, scale: 2
      t.integer :bill_type, null: false
      t.integer :status, null: false, default: 0  # default integer value for 'pending'
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
