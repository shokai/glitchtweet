# -*- coding: utf-8 -*-
module Kirakira
  def Kirakira.glitch(str)
    arr = "☆ .。.:* .。.:*･ﾟ∞∮+'∮+'★*｡.::･'ﾟ｡.::･'ﾟ｡.:*:･'ﾟ".split(//u)
    count = 0
    last = nil
    kira = ""
    loop do
      c = arr[rand(arr.size)]
      next if last == c
      kira += c
      last = c
      count += 1
      break if count > 8 and rand < 0.1
    end
    kira + str + kira.split(//u).reverse.join('')
  end
end
