class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :text
      t.string :answer
      t.integer :start_difficulty

      t.timestamps
    end
  end
end
