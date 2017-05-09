require "rexml/document"
class QuestionCollection
  attr_reader :score
  def initialize(doc)
    @score = 0
    @questions = []
    doc.elements.each("questions/question") do |params|
      @questions << Question.new(params)
    end
  end

  def questions_size
    @questions.size
  end

  def ask_questions
    @questions.each do |question|
      question.print
      question_time = Time.now.to_i
      user_choice = STDIN.gets.to_i
      user_time = Time.now.to_i - question_time
      if question.right?(user_choice) && question.timer?(user_time)
        @score += 1
        puts "Правильный ответ!"
      else
        puts "Неправильно. Правильный ответ: #{question.right_answer}"
      end
    end
  end
end
