class Acronym
  def self.abbreviate(phrase)
    Acronym.new(phrase).abbreviation
  end

  def abbreviation
    initials.join
  end

  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def initials
    words.map { |w| w.chars.first.upcase }
  end

  def words
    words.map(&method(:decompose_word)).flatten
  end

  def words
    phrase.split(' ')
  end

  def decompose_word(word)
    decompose = word.scan(/[Aa-Zz]+/)
    decompose.empty? ? word.split('-') : decompose
  end
end
