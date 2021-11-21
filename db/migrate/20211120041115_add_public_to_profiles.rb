class AddPublicToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :public, :boolean, default: false
  end
end
