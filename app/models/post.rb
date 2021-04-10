class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(attributes)
    attributes.values.each do |attribute|
      if !attribute["name"].blank?
        category = Category.find_or_create_by(attribute)
        self.categories << category
      end
    end
  end
end
