class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :token

      t.timestamps null: false
    end

    add_index :organizations, :token, unique: true
  end
end
