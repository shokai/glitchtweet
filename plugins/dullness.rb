# -*- coding: utf-8 -*-
module Dullness
  def Dullness.glitch(str)
    $KCODE = 'u'
    str = str.tr('かきくけこさしすせそたちつてと','がぎぐげござじずぜぞだぢづでど').
      tr('はひふへほ','ばびぶべぼ').
      tr('カキクケコサシスセソタチツテト','ガギグゲゴザジズゼゾダヂヅデド').
      tr('ハヒフヘホ','バビブベボ')
    'あいうえおなにぬねのまみむめもやゆよわをんアイウエオナニヌネノマミムメモヤユヨワヲン'.split(//u).each{|i|
      str.gsub!(/#{i}"/, i)
      str.gsub!(/#{i}/, "#{i}\"")
    }
    return str
  end
end
