class Bill < ApplicationRecord
    belongs_to :user
    enum :status, {pending: 0, approved: 1, rejected: 2}, _default: :pending
    enum :bill_type, {food: 0, travel: 1, others: 2}

    validate :user_must_be_employee

    def user_must_be_employee
        if user.present? && user.role != 'employee'
            errors.add(:user, 'must have role employee')
        end
    end
end
