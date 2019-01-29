class Almoxarifado::Material < ApplicationRecord
  validates :descricao, presence: true, uniqueness: true
  validates_numericality_of :quantidade, greater_than_or_equal_to: 0

  has_many :entradas, foreign_key: 'almoxarifado_materiais_id'
  has_many :retiradas, foreign_key: 'almoxarifado_materiais_id'

  before_destroy :checar_entradas_e_retiradas

  scope :ordernado, -> { order :descricao }

  def checar_entradas_e_retiradas
    return true if (entradas.count == 0 and retiradas.count == 0)
    errors.add(:base, 'Não foi possível remover materiais com entradas/retiradas cadastradas.')
  end

end