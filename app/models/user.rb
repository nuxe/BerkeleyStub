class User < ActiveRecord::Base
	attr_accessible :email, :password

  SUCCESS = 1
  ERR_BAD_CREDENTIALS = -1
  ERR_USER_EXISTS = -2
  ERR_BAD_EMAIL = -3
  ERR_OTHER = -4

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_many :tickets

  before_save { self.email = email.downcase }

  def login(email, password)
  	usr = User.where(email: email.downcase).first
  	if usr.nil?
  		return ERR_BAD_CREDENTIALS
  	end
  	if usr.password != password
  		return ERR_BAD_CREDENTIALS
  	end
  	usr.save
  	return SUCCESS
  end

  def add(email, password)
  	usr = User.where(email: email.downcase).first
  	if not usr.nil?
  		return ERR_USER_EXISTS
  	end
  	usr = User.new(email: email, password: password)
  	if not usr.valid?
  		return ERR_BAD_EMAIL
  	end
  	usr.save
  	return SUCCESS
  end

end
