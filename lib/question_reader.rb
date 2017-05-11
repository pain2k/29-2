require 'rexml/document'
class QuestionReader
  attr_reader :questions
  def initialize(file_path)
    @questions = []
    file_name = file_path + '/data/questions.xml'
    file = File.new(file_name, "r:UTF-8")
    doc = REXML::Document.new(file)
    file.close
    doc.elements.each("questions/question") do |params|
      @questions << Question.new(params)
    end
  end
end
