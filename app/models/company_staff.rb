class CompanyStaff < ApplicationRecord
  belongs_to :company
  belongs_to :staff
end
