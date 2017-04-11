class Page < ApplicationRecord
  enum status: { in_progress: 0, indexed: 1, index_failed: 2 }

  has_many :elements

  validates :url, presence: true, uniqueness: true
  validate :url_format

  def self.filter(params)
    page_number = params[:page_number].present? ? params[:page_number] : 1

    pages = order(updated_at: :desc)
    pages.page(page_number)
  end

  private

  def url_format
    unless url =~ /(\A\z)|(\A((http|https):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\z)/ix
      errors.add(:url, "value is not a valid HTTP URL")
    end
  end
end
