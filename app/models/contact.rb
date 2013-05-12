class Contact
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :message

  validates :name, :presence => {:message => 'Nome'}
  validates :email, :presence => {:message =>  'Email'}
  validates :email, :format => {:with => %r{.+@.+\..+}, :message =>  'Email invalido', :allow_blank => true}
  validates :message, :presence => {:message =>  'Mensagem'}

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end