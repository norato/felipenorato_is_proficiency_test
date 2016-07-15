class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name, limit: 45
      t.string :register_name, limit: 45
      t.integer :status

      t.timestamps
    end
  end
end
