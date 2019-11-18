class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :question_type
      t.integer :answer
      t.references :app_test, foreign_key: true
      t.timestamps
    end
  end
end
