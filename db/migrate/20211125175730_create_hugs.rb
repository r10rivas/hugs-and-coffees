class CreateHugs < ActiveRecord::Migration[6.1]
  def change
    create_table :hugs do |t|
      t.decimal :duration
      t.string :name
      t.text :message
      t.string :occupation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
