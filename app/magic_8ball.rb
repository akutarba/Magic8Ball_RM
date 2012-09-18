class Magic8ball
  # To change this template use File | Settings | File Templates.
  def initialize
    @answers = loadAnswers
  end

  def randomAnswer
    @answers.sample
  end

  def loadAnswers
    answerFile = NSBundle.mainBundle.pathForResource('answers', ofType: 'json')

    errorPointer = Pointer.new(:object)

    data = NSData.alloc.initWithContentsOfFile(answerFile,
                                               options: NSDataReadingUncached,
                                               error: errorPointer)
    unless data
      printError errorPointer[0]
      return defaultAnswers
    end
    json = NSJSONSerialization.JSONObjectWithData(data,
                                                  options: NSDataReadingUncached,
                                                  error: errorPointer)
    unless json
      printError errorPointer[0]
      return defaultAnswers
    end
    json['answers']

  end

  def defaultAnswers
    ['Yes', 'No', 'Maybe', 'Try Again']

=begin
    name = "ruby motion"
    arr = name.split.insertObject("Try", atIndex:0).sample
    arr.push "Ruby"
    arr.insertObject("Motion", atIndex:2)
=end

  end

  def printError(error)
    $stderr.puts "Error: #{error.description}"
  end

end