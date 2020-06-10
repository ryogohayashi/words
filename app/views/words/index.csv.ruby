require 'csv'

CSV.generate do |csv|
  column_names = ["id", "単語", "意味"]
  csv << column_names
  id = 1
  @word.each do |word|
    column_values = [
      id,
      word.word,
      word.meaning
    ]
    id += 1
    csv << column_values
  end
end