if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/result_printer'
require_relative 'lib/question_reader'
require_relative 'lib/question'
require_relative 'lib/question_collection'

reader = QuestionReader.new(File.dirname(__FILE__))
test = QuestionCollection.new(reader.questions)

test.ask_questions

result = ResultPrinter.new(test.score,test.questions_size)
result.print
