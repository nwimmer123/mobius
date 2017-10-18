class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.integer :credit
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
