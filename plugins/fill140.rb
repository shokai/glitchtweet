# -*- coding: utf-8 -*-
module Fill140
  def Fill140.glitch(str)
    len = str.split(//u).size
    result = ''
    (140/len).times do
      result += str
    end
    result.chomp.strip
  end
end
