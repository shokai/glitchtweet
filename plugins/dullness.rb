# -*- coding: utf-8 -*-
module Dullness
  def Dullness.glitch(str)
    $KCODE = 'u'
    arr = str.tr('かきくけこさしすせそたちつてと','がぎぐげござじずぜぞだぢづでど').
      tr('はひふへほ','ばびぶべぼ').
      tr('カキクケコサシスセソタチツテト','ガギグゲゴザジズゼゾダヂヅデド').
      tr('ハヒフヘホ','バビブベボ')
  end
end
