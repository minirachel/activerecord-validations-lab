require 'pry'

class TitleValidator < ActiveModel::Validator 
    
    CLICKBAIT = [
        /Secret/i, 
        /Won't Believe/i,
        /Top \d+ /i, 
        /Guess/i,
    ]

    def validate(record)
        if record.title != nil
            # binding.pry
            if is_clickbait?(record) == []
                record.errors[:title] << "Please write stronger clickbait."
            end
        end
    end

    def is_clickbait?(record)
        CLICKBAIT.select do |c|
            record.title.match(c)
        end
    end

end