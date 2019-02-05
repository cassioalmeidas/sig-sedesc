class Papel < ApplicationRecord
	validates :nome, presence: true, uniqueness: true
  has_many :papel_usuarios
  has_many :usuarios, through: :papel_usuarios
end
