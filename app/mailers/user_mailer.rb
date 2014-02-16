class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  ONE_WEEK= 7
  TWO_WEEKS= 14
  
  def welcome_email(food)
    @food = food
    @url = 'http://example.com/login'
    mail(to: 'b.madhusudan@gmail.com', subject: 'Welcome to my hall')
  end

  def email_expiring_foods

    # Find expired foods

    @expired_foods = Food.where("expires_on < ?", Date.today)
    

    # Find foods expiring in the next 1 week
    @one_week_foods = Food.where("expires_on <= ? AND expires_on >= ?", Date.today + ONE_WEEK, Date.today)


    # Find foods expiring after the 1st week but before 2nd week
    @two_week_foods = Food.where("expires_on <= ? AND expires_on >= ?", Date.today+TWO_WEEKS, Date.today + ONE_WEEK
)
    debugger
    mail(to: 'b.madhusudan@gmail.com', subject: 'Foods that are going to waste!!')

  end

end
