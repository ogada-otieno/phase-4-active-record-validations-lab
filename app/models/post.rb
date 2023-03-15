class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    
    # Post category is either Fiction or Non-Fiction
    # This step requires an inclusion validator
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :not_allow_true_facts

    # Custom validations: is expected not to allow :title to be ‹"True Facts"›

    def not_allow_true_facts
        if title == "True Facts"
            errors.add(:title, "Cannot be 'True Facts'")
        end
    end

end
