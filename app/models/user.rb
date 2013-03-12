class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  validates :first_name, presence: true
  validates :last_name, presence: true

  default_scope order("last_name ASC, first_name ASC")

  # Set the user as inactive by default, and ensure that someone has to check who the user is
  before_create do
    self.active = true if invited_to_sign_up?
  end

  after_create do
    AdminNotifier.activate(self).deliver unless active?
  end

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
