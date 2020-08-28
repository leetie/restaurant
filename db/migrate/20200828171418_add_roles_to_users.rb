class AddRolesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :manager_role, :boolean, default: false
    add_column :users, :employee_role, :boolean, default: false
    add_column :users, :user_role, :boolean, default: true
  end
end
