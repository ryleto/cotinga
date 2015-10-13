class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    
    User.create! do |u|
        u.email     = 'admin@admin.com'
        u.password  = 'admin1234'
        u.role      = 'admin'
    end
  end
end
