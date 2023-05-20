class AddHashSenhaToAdministrador < ActiveRecord::Migration[5.2]
  def change
    add_column :administradors, :senha_hash, :string
  end
end
