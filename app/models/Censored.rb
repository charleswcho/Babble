class Censored
  include Singleton

  attr_reader :censoredWords

  def initialize
    @censoredWords = {}
    generate
  end

  def censor(sentence)
    censor = sentence.split.any? { |word| @censoredWords[word] }

    censor ? '&lt;message deleted&gt;' : sentence
  end

  private

  def generate
    i = 0

    while i < 20_000
      currWord = ('a'..'z').to_a.shuffle[0,8].join

      # Enforce uniqueness
      if @censoredWords[currWord]
        next
      else
        @censoredWords[currWord] = true
        i += 1
      end
    end

    @censoredWords['Kappa'] = true
  end
end
