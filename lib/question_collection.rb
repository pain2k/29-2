require "rexml/document"
class QuestionCollection
  def initialize(doc)
    @questions = []
    doc.elements.each("questions/question") do |params|
      @questions << Question.new(params)
    end
  end

  def to_a
    @questions
  end

  def next_question
    for question in @question

    end
  end

  def status
    if
  end

end
