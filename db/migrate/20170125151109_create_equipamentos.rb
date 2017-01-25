class CreateEquipamentos < ActiveRecord::Migration
  def change
    create_table :equipamentos do |t|
      t.string :tipo
      t.string :descricao
      t.string :responsavel

      t.timestamps null: false
    end
  end
end
