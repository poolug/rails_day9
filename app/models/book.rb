class Book < ApplicationRecord
    enum status: %w[Prestado Estante]

    # valida datos en blanco en el form
    validates :title, :author, presence: true
end
