
words = []

def check_for_duplicate p, words
  unless words.include? p.join("")
    words.push(p.join(""))
  end
end

def get_sequence line, words
  alphabet = line.chars
  permutations = alphabet.permutation(4).to_a
  res = permutations.map do |p|
     check_for_duplicate p, words
    {sequences: line, words: p.join("")}
  end
  res
end

IO.foreach('./dictionary words.txt') do |full_line|
  line = full_line.strip
  if line.length > 4
    puts get_sequence(line, words)
  else
    puts sequences: line, words: line
  end
end

