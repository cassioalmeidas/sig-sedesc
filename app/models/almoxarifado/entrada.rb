class Almoxarifado::Entrada < ApplicationRecord
  belongs_to :almoxarifado_materiais
  validates :almoxarifado_materiais_id, :quantidade, presence: true

  after_save :atualizar_quantidade_materiais

  scope :ordenado, -> { order created_at: :desc }

  def atualizar_quantidade_materiais
    almoxarifado_materiais.update(quantidade: (almoxarifado_materiais.quantidade + quantidade))
  end
end
