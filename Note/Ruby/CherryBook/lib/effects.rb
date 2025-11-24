module Effects
  def self.reverse
    lambda do |words|
      words.split(' ').map(&:reverse).join(' ')
    end
  end

  def self.echo(rate)
    lambda do |words|
      words.each_char.map { |c| c == ' ' ? c : c * rate }.join
    end
  end

  def self.loud(level)
    lambda do |words|
      words.split(' ').map { |word| word.upcase + '!' * level }.join(' ')
    end
  end
end
