class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :must_be_clickbait

  def must_be_clickbait
    if [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i].none?{
      |pattern| pattern.match(title)
    }
      errors.add(:title, "Not clickbait-y enough!")
    end
  end
end
