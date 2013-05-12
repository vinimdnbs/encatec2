class User < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt_password
  after_save :clear_password

  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..60 }
  validates :password, :presence => true
  #Only on Create so other actions like update password attribute can be nil
  validates_length_of :password, :in => 6..16, :message=>"A senha deve ter entre 6 a 16 caracteres."

  attr_accessible :username, :password, :password_confirmation

  def self.authenticate(username="", password="")
    user = User.find_by_username(username)

    if user && user.match_password(password)
      return user
    else
      return false
    end
  end

  def match_password(password="")
    encrypted_password == BCrypt::Engine.hash_secret(password, salt)
  end

  def encrypt_password
    unless password.blank?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end
end
