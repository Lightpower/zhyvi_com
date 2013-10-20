class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  
  validate :username_and_email

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def show_name
    self.username || self.email
  end

  private

  ##
  # Validation of username and email
  #
  def username_and_email
    # Check if both :username and :email are not empty
    errors.add(:base,     'Укажите логин или email.') if self.username.blank? && self.email.blank?
    # field contains correct characters only
    errors.add(:username, 'может состоять только из букв латиницы, цифр и символов "- _ . @".') unless self.username.blank? || self.username =~ /([A-Za-z0-9(\-_\.@)]+)/
    errors.add(:email,    'не соответствует формату.') unless self.email.blank? || self.email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    # Check both :username and :email
    [:username, :email].each do |field|
      # field is unique or nil
      errors.add(field, 'уже зарегистрирован. Выберите другой.') if self.send(field).present? && User.where(field => self.send(field)).present?
    end
  end
end
