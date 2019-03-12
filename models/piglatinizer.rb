class PigLatinizer

    attr_reader :wordx

    def initialize (wordx="wordx")
        @wordx=wordx
    end

    def latinize (word)
        count=-1
        i=0
        pig=false

        while !pig
            # binding.pry
            pig=is_vowel(word[i])
            if !pig
                count+=1
                i+=1
            end 
        end

        # if count<0 && word.length==1
        #     return "#{word}way"

        if count<0
            return "#{word}way"
        else
            first_half=word.slice(0..count)
            second_half=word.slice((count+1)..(word.length-1))
            "#{second_half}#{first_half}ay"
        end
    end

    def piglatinize (words)
        arr=words.split(" ")
        a=arr.map {|w| self.latinize(w)}
        a.join(" ")
    end

    def is_vowel (letter)
        letter=letter.downcase
        letter=='a'||letter=='e'||letter=='i'||letter=='o'||letter=='u'||letter=='y'
    end
end