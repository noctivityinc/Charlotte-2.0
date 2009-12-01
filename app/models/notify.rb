class Notify < ActionMailer::Base
  
  def thankyou(supporter, sent_at = Time.now)
    subject    'Thank you for supporting Charlotte 2.0'
    recipients supporter.email
    from       'charlotte20@noctivity.com'
    sent_on    sent_at
    content_type "text/html"

    body       :supporter => supporter 
  end
  
  def new_supporter(supporter, sent_at = Time.now)
    subject    "New Charlotte 2.0 Supporter: #{supporter.company}"
    recipients 'charlotte20@noctivity.com'
    from       supporter.email
    sent_on    sent_at
    content_type "text/html"

    body       :supporter => supporter
  end

end
