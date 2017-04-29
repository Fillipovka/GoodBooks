class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
    	t.string :title
    	t.text :description
    	t.integer :yearPublication
    	t.text :biography
    	t.string :birthplace
    	t.date :dateOfBirth

    	t.belongs_to :author, index: true
      t.timestamps
    end
  end
end
