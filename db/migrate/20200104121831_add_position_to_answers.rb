class AddPositionToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :position, :integer
    Question.all.each do |question|
      question.answers.each.with_index do |answer, index|
        answer.update_column :position, index
      end
    end
  end
end
