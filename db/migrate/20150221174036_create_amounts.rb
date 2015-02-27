class CreateAmounts < ActiveRecord::Migration
  def change
    create_table :amounts do |t|
  
      t.integer :default, default: 1500

      t.timestamps null: false

    end
  end
end
