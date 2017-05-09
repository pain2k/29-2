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
end