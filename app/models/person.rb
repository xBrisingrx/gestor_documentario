class Person < ApplicationRecord
  belongs_to :company

  has_one_attached :pdf_dni
  has_one_attached :pdf_cuil
  has_one_attached :pdf_start_activity

  validates :dni, 
    presence: true, if: :dni_has_expiration?,
    numericality: { only_integer: true, message: "Deben ser números" },
    length: { minimum: 8, too_short: "Mínimo son %{count} caracteres." }
  validates :expiration_date_dni, 
    presence: true, 
    if: :dni_has_expiration?
end
