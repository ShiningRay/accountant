module Accountant
  class Account < ApplicationRecord
    ZERO = 0.to_d
    class InsufficientBalanceError < StandardError; end

    belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
    belongs_to :subject, polymorphic: true, optional: true

    validates :owner_id, presence: true

    def add_funds(amount, reason = :unknown, **args)
      raise ArgumentError, 'Amount to add must be larger than 0' if amount <= ZERO

      change_balance(amount, reason, **args)
    end

    def sub_funds(amount, reason = :unknown, **args)
      raise ArgumentError, 'Amount to substract must be larger than 0' if amount <= ZERO

      change_balance(-amount, reason, **args)
    end

    private

    # change balance and check
    # @param amount [BigDecimal]
    # @param reason [Object]
    def change_balance(amount, reason, cause: nil, memo: nil)
      transaction requires_new: true do
        lock!
        self.nonce += 1
        self.balance += amount
        raise 'balance must greater than or equal to 0' if balance < ZERO

        save!
        if sn
          unless AccountLog.exists?(sn:)
            logs.create!(nonce:, delta: amount, balance_after: balance, reason:, cause:, memo:)
          end
        else
          logs.create!(nonce:, delta: amount, balance_after: balance, reason:, cause:, memo:)
        end
      end
    end
  end
end
