class Almoxarifado::Material < ApplicationRecord
  audited
  validates :descricao, presence: true, uniqueness: true
  validates_numericality_of :quantidade, greater_than_or_equal_to: 0

  has_many :entradas, foreign_key: 'almoxarifado_materiais_id', class_name: 'Almoxarifado::Entrada', dependent: :restrict_with_error
  has_many :retiradas, foreign_key: 'almoxarifado_materiais_id', class_name: 'Almoxarifado::Retirada', dependent: :restrict_with_error

  before_destroy :checar_entradas_e_retiradas

  scope :ordenado, -> { order created_at: :desc }

  def checar_entradas_e_retiradas
    return true if (entradas.count == 0 and retiradas.count == 0)
    errors.add(:base, 'Não foi possível remover materiais com entradas/retiradas cadastradas.')
  end


  def to_s
    descricao
  end
end
