class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :desc
      t.float :price
      t.string :condition
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
