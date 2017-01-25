class AddSetorToEquipamento < ActiveRecord::Migration
  def change
    add_column :equipamentos, :setor, :string
  end
end
