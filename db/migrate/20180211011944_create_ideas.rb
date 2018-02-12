class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
    end
  end
end
