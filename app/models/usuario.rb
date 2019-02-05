class Usuario < ApplicationRecord
  audited
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable, :recoverable
  devise :database_authenticatable, :rememberable, :validatable
  has_many :papel_usuarios
  has_many :papeis, through: :papel_usuarios

  def papel?(papel)
  	papeis.any? { |p| p.nome.underscore.to_sym == papel }
  end
end
