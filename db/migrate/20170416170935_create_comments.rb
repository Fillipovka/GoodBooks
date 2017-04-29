class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :text_comment
      t.belongs_to :user, index: true
      t.belongs_to :post, index: true
      
      t.timestamps
    end
  end
end
