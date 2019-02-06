class Papel < ApplicationRecord
  has_and_belongs_to_many :usuarios, :join_table => :usuarios_papeis
  belongs_to :resource,
             :polymorphic => true,
             :optional => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify
  NAMES = %w{ sysadmin admin operador visitante }
  # RESOURCE_TYPES = %w{ Almoxarifado::Entrada }

  validates :name, inclusion: { in: NAMES }
  # validates :resource_type, inclusion: { in: RESOURCE_TYPES }
end
