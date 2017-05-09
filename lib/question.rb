class Question
  attr_reader :timer, :text, :answers, :right_answer
  def initialize(params)
    @timer = params.attributes["timer"].to_i
    @text = params.elements["text"].text
    @answers = []
    params.elements.each("variants/variant") do |item|
      @answers << item.text
      @right_answer = item.text if item.attributes["right"] == "true"
    end

  end

  def print
    puts @text
    @answers.shuffle!.each_with_index { |answer, index| puts "#{index + 1}. #{answer}" }
  end

  def right?(user_input)
    return @answers[user_input - 1] == @right_answer
  end

  def timer?(user_time)
    return user_time <= @timer
  end
end
