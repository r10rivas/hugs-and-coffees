class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.string :biography
      t.string :occupation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
