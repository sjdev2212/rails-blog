class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_posts_counter
  after_destroy :update_posts_counter

  def update_posts_counter
    author.update(posts_counter: author.posts.length)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
