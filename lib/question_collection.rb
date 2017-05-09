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
      print ">"
      user_time = Time.now.to_i - question_time
      case question.timer?(user_time)
        when false
          puts "К сожалению время вышло"
          next
        when true
          if question.right?(user_choice)
            @score += 1
            puts "Правильный ответ!"
          else
            puts "Неправильно. Правильный ответ: #{question.right_answer}"
          end
      end

    end

  end
end
