class Magic8ball
  # To change this template use File | Settings | File Templates.
  def initialize
    @answers = ["Yes","No","Maybe", "Try again"]
  end
  def randomAnswer
    @answers.sample
  end
  def defaultAnswers

=begin
    name = "ruby motion"
    arr = name.split.insertObject("Try", atIndex:0).sample
    arr.push "Ruby"
    arr.insertObject("Motion", atIndex:2)
=end

  end

end