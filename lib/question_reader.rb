require 'rexml/document'
class QuestionReader
  attr_reader :doc
  def initialize(file_path)
    file_name = file_path + '/data/questions.xml'
    file = File.new(file_name, "r:UTF-8")
    @doc = REXML::Document.new(file)
    file.close
  end
end