class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :user_id
      t.string :question_id
      t.string :outcome
      t.integer :time

      t.timestamps
    end
  end
end
