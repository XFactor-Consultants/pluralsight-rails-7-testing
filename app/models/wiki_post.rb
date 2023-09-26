class WikiPost < ApplicationRecord
  has_one_attached :image

  scope :contributors, -> { pluck(:author).uniq }
  scope :sort_by_created, -> { order(created_at: :desc)}
end
