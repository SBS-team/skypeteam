class AdminMailer < ActionMailer::Base
  default to: Proc.new { AdminUser.pluck(:email) }

  def contact_us(email,text)
    mail(from: email , subject: "#{text}")
  end

  def receive(email)
    page = Page.find_by(:address => email.to.first)
    page.emails.create(
        subject: email.subject
    )
  end
end