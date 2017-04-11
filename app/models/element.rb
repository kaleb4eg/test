class Element < ApplicationRecord
  belongs_to :page

  validates :element_type, presence: true
end
