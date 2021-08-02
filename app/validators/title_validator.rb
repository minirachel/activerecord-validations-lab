class TitleValidator < ActiveModel::Validator 
    def validate(record)
       if CLICKBAIT.none? (|p| p.match record.title)
        record.errors[:title] << "Please write stronger clickbait."
        end
    end

    CLICKBAIT = [
        /Won't Believe/i,
        /Secret/i, 
        /Top \d+ /i, 
        /Guess/i,
    ]
end