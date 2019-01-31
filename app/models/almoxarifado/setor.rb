class Almoxarifado::Setor < ApplicationRecord
  has_many :retiradas, foreign_key: 'almoxarifado_materiais_id', class_name: 'Almoxarifado::Retirada'
  validates :descricao, presence: true

  def to_s
    descricao
  end
end
