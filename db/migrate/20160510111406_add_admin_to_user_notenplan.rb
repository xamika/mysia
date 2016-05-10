class AddAdminToUserNotenplan < ActiveRecord::Migration
  def change
    add_column :user_notenplans, :admin, :boolean
  end
end
  
