class CreateAdminSupporters < ActiveRecord::Migration
  def self.up
    create_table :supporters do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :website
      t.text :comment
      t.timestamps
    end
  end
  
  def self.down
    drop_table :supporters
  end
end
