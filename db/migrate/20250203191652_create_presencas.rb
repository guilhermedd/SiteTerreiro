class CreatePresencas < ActiveRecord::Migration[6.0]
  def change
    create_table :presencas do |t|
      t.string :email, null: false
      t.integer :quantidade, null: false
      t.references :gira, null: false, foreign_key: true

      t.timestamps
    end

    add_index :presencas, [:email, :gira_id], unique: true
  end
end
