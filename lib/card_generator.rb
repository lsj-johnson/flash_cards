
class CardGenerator
  attr_reader :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards    = read_file
  end

  def read_file

    file_array = IO.readlines(@filename, chomp: true)

    card_data = []

    file_array.each do |card|
      card_data << card.split(',')
    end

    card_array = []

    card_data.each do |data|
      new_card = Card.new(data[0], data[1], data[2].to_sym)
      card_array << new_card
    end

    card_array

  end
end
