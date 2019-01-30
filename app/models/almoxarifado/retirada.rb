class Almoxarifado::Retirada < ApplicationRecord
  belongs_to :almoxarifado_materiais, class_name: 'Almoxarifado::Material'

  validates :almoxarifado_materiais_id, :quantidade, presence: true

  validate :quantidade_suficiente_para_retirada?

  after_save :atualizar_quantidade_materiais

  scope :ordenado, -> { order created_at: :desc }

  def atualizar_quantidade_materiais
    almoxarifado_materiais.update(quantidade: (self.quantidade - quantidade))
  end

  def quantidade_suficiente_para_retirada?
    return unless almoxarifado_materiais
    if (almoxarifado_materiais.quantidade - self.quantidade) < 0
      errors.add(:base, "para a retirada permitida: #{almoxarifado_materiais.quantidade}")
    end
  end
end
