class AdminMailer < ActionMailer::Base
  default to: "noreply@is-valid.org"


  def contact_us(email,text)
    mail(from: email , subject: "#{text}")
  end

  def receive(email)
    page = Page.find_by_address(email.to.first)
    page.emails.create(
        subject: email.subject
    )
  end
end