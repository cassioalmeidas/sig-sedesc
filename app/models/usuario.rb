class Usuario < ApplicationRecord
  attr_writer :login
  before_destroy :checa_primeiro_sysadmin
  rolify :role_cname => 'Papel'
  audited
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable, :recoverable
  devise :database_authenticatable, :rememberable, :validatable

  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_h).first
    end
  end

  def validate_username
    if Usuario.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end  

  def checa_primeiro_sysadmin
    return true if Usuario.with_role(:sysadmin).first != self
    errors.add(:base, 'O primeiro usuário sysadmin não pode ser removido.')
    throw(:abort)
  end

  def email_required?
    false
  end
end
