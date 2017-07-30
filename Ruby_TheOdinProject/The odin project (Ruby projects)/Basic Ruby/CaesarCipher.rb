def determine chr
  flag = 'Z' <=> chr
  if flag == 0
    chr = 'Z'
  elsif flag == 1
    chr = " "
  else
    chr = 'z'
  end
  chr
end
def caesar_cipher(text,move)
  new_text = ""
  text.each_char do |chr|
    move.times do
      if chr.next == 'z' || chr.next == 'Z' || chr.next == '%'
        chr = determine(chr.next)
      else
        chr.next!
      end
    end
    new_text+=chr
  end
  new_text
end
puts caesar_cipher("What a string!", 5)
