class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :question_answer, :question_id
  belongs_to :entry
end
