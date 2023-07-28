class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews
    def favorite_product
        min = reviews.maximum(:star_rating)
        rev = reviews.find_by(star_rating: min)
        products.find(rev.product_id)
    end
    def remove_reviews product
        reviews_remove = self.reviews.where(product: product)
        reviews_remove.destroy_all
    end


end