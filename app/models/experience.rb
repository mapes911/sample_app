class Experience < ActiveRecord::Base
  attr_accessible :title
  belongs_to :user

  # filters
  before_create :create_slug

  # validation
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 300 }

  def create_slug
    self.slug = self.title.parameterize
  end

end
