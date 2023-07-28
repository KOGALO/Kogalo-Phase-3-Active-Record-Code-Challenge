class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews
    def leave_review user, star_rating, comment
        Review.create(comment: comment, star_rating: star_rating, user_id: user.id, product_id: self.id)
    end
    def print_all_reviews
        self.reviews.map do |review|
            puts "Review for #{review.product.name} by #{review.user.name}: #{review.star_rating}. #{review.comment}"
        end
    end
    def average_rating
        sum = self.reviews.sum(:star_rating)
        average = sum.to_f / self.reviews.count
    end
end