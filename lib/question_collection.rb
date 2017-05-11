require "rexml/document"
class QuestionCollection
  attr_reader :score

  def initialize(questions)
    @score = 0
    @questions = questions
  end

  def questions_size
    @questions.size
  end

  def ask_questions
    @questions.each do |question|
      question.print
      question_time = Time.now.to_i
      print ">"
      user_choice = STDIN.gets.to_i
      user_time = Time.now.to_i - question_time
      if question.timer?(user_time)
        if question.right?(user_choice)
          @score += 1
          puts "Правильный ответ!"
        else
          puts "Неправильно. Правильный ответ: #{question.right_answer}"
        end
      else
        puts "К сожалению время вышло"
        next
      end
    end
  end
end
