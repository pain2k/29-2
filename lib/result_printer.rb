class ResultPrinter
  def initialize(score,questions_size)
    @score = score
    @questions_size = questions_size
  end

  def print
    puts "У Вас #{@score} правильных ответов из #{@questions_size}"
  end
end