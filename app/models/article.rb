class Article < ApplicationRecord
  belongs_to :utilisateur
  default_scope -> {order(created_at: :desc)}

  validates :utilisateur_id, presence: true
  validates :title, presence: true ,length:{maximum: 200}
  validates :description, presence: true ,length:{maximum: 20000}

end
