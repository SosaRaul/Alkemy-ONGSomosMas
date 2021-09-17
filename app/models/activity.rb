class Activity < ApplicationRecord
    validates :name, uniqueness: true, :content, presence: true
    has_one_attached :image, service: :s3
end
