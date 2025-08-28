class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # :confirmable se você tiver migrado as colunas

  # Validação customizada para update
  validate :at_least_one_field_present, on: :update

  private

  def at_least_one_field_present
    if email.blank? && password.blank? && password_confirmation.blank?
      errors.add(:base, "Por favor, preencha pelo menos um campo antes de atualizar.")
    end
  end
end
