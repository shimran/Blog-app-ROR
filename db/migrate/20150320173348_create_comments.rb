class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

      t.column :name, :string
      t.column :description, :string
      t.column :post_id, :integer

      t.timestamps
    end
  end
end
