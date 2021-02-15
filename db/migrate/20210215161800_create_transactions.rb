class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :boat_size
      t.integer :transaction_price
      t.datetime :date
      t.boolean :status

      t.timestamps
    end
  end
end
