class ContactsMailer < ActionMailer::Base
  default :from => "Contato ENCATEC <encatec2@gmail.com>"
  default :to => "Adapti <encatec@adapti.info>"

  def new_contact(contact)
    @contact = contact
    mail(:subject => "Contato de #{contact.name}")
  end
end
