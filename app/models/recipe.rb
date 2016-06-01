class Recipe < ActiveRecord::Base

  # Associations
  has_many :ingredients
  has_many :directions

  belongs_to :user

  # Cocoon:
  accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['name'].blank?}, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: proc { |attributes| attributes['step'].blank?}, allow_destroy: true

  # Ensure the parameters are present on save
  validates :title, :description, :image, presence: true

  has_attached_file :image, styles: { medium: "400x400#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
