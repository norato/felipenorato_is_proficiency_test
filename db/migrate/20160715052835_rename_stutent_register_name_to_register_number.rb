class RenameStutentRegisterNameToRegisterNumber < ActiveRecord::Migration
  def change
    rename_column :students, :register_name, :register_number
  end
end
