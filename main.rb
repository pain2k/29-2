if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/test'
require_relative 'lib/question_reader'
require_relative 'lib/question'
require_relative 'lib/question_collection'

reader = QuestionReader.new(File.dirname(__FILE__))

test = QuestionCollection.new(reader.doc)

while test.status == 0
  test.next_question
  test.ask_answer

end
