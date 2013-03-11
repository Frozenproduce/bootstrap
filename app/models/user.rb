class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  # attr_accessible :title, :body

  validates :first_name, presence: true
  validates :last_name, presence: true

  default_scope order("last_name ASC, first_name ASC")

  def name
    [first_name, last_name].compact.join(' ')
  end

  def active_for_authentication?
    super && active?
  end

  def suspend!
    self.active = false
    save!
  end

  def activate!
    self.active = true
    save!
  end

end
