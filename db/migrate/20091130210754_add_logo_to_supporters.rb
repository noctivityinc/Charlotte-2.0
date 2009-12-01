class AddLogoToSupporters < ActiveRecord::Migration
  def self.up
    add_column :supporters, :logo_file_name,    :string
    add_column :supporters, :logo_content_type, :string
    add_column :supporters, :logo_file_size,    :integer
    add_column :supporters, :logo_updated_at,   :datetime
  end

  def self.down
    remove_column :users, :logo_file_name
    remove_column :users, :logo_content_type
    remove_column :users, :logo_file_size
    remove_column :users, :logo_updated_at
  end
end
