class EmployeeDetail < ApplicationRecord
    belongs_to :user
    validate :user_must_be_employee

    def user_must_be_employee
        if user.present? && user.role != 'employee'
            errors.add(:user, 'must have role employee')
        end
    end
end
