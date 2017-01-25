class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :token
      t.string :eqp

      t.timestamps null: false
    end
  end
end
