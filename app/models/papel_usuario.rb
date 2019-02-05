class PapelUsuario < ApplicationRecord
  belongs_to :papel
  belongs_to :usuario
end
