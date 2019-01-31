class Almoxarifado::Entrada < ApplicationRecord
  audited
  belongs_to :almoxarifado_materiais, class_name: 'Almoxarifado::Material'
  validates :almoxarifado_materiais_id, :quantidade, presence: true

  after_save :atualizar_quantidade_materiais

  scope :ordenado, -> { order created_at: :desc }

  def atualizar_quantidade_materiais
    almoxarifado_materiais.update(quantidade: (almoxarifado_materiais.quantidade + quantidade))
  end
end
