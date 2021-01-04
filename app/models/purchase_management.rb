class PurchaseManagement < ApplicationRecord
  with_options presence: true do
    belongs_to :user
    belongs_to :item
  end
end
