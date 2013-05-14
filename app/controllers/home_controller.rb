#encoding=UTF-8

class HomeController < ApplicationController
  def index
    @title = '2º Encontro Norte Capixaba de Tecnologia'
    @contact = Contact.new
  end

  def create_contact
    @contact = Contact.new(params[:contact])

    if @contact.valid?
      ContactsMailer.new_contact(@contact).deliver
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end
end
