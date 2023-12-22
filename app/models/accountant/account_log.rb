module Accountant
  # record every change to account record
  # use for auditing
  class AccountLog < ApplicationRecord
    belongs_to :account
    belongs_to :cause, polymorphic: true, optional: true

    validates :account_id, presence: true
    validates :delta, presence: true
    validates :balance_after, presence: true
  end
end
