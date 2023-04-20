class CreateVeiculos < ActiveRecord::Migration[5.2]
  def change
    create_table :veiculos do |t|
      t.string :marca
      t.string :cor
      t.integer :qnt_passageiros

      t.timestamps
    end
  end
end
