class CreateInvestments < ActiveRecord::Migration[5.0]
  def change
    create_table :investments do |t|
      t.date :date
      t.string :purpose
      t.integer :amount
      t.boolean :incomeOutcome
      t.boolean :assetLiability

      t.timestamps
    end
  end
end
