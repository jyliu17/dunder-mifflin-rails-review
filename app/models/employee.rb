class Employee < ApplicationRecord
    belongs_to :dog

    def full_name
        "#{first_name} #{last_name}"
    end
end
