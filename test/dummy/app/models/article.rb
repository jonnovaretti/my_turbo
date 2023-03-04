class Article < ApplicationRecord
  validates :context, presence: true
end
