class Magic8BallViewController < UIViewController
  # To change this template use File | Settings | File Templates.
  def loadView
    self.view = UIImageView.alloc.init
  end

  def viewDidLoad
    #labelFrame = CGRectMake (10,60,300,80)
    view.image = UIImage.imageNamed('background.png')
    #labelFrame = [[10,60],[300,80]]
    #@label = UILabel.alloc.initWithFrame(labelFrame)
    @label = makeLabel

    view.addSubview(@label)
    view.userInteractionEnabled=true
    recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, :action => 'showAnswer')
    view.addGestureRecognizer(recognizer)
    @magicBall = Magic8ball.new
  end

  def showAnswer
    #@label.text = ['yes','no','maybe','try again'].sample
    #@label.text = @magicBall.randomAnswer
    #@label.alpha = 0
    UIView.animateWithDuration(1.0,
                               :animations => lambda {
                                 @label.alpha=0
                                 @label.transform=CGAffineTransformMakeScale(0.1, 0.1)
                               },
                               completion: lambda { |finished|
                                 @label.text=@magicBall.randomAnswer
                                 UIView.animateWithDuration(1.0,
                                                            animations: lambda {
                                                              @label.alpha=1
                                                              @label.transform=CGAffineTransformIdentity
                                                            })
                               })
  end

  def makeLabel
    label = UILabel.alloc.initWithFrame([[10, 60], [300, 80]])
    label.backgroundColor=UIColor.lightGrayColor
    label.text="Tap to Answer"
    label.font=UIFont.boldSystemFontOfSize(34)
    label.textColor= UIColor.darkGrayColor
    label.textAlignment=UITextAlignmentCenter
    label
  end
end