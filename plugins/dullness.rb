# -*- coding: utf-8 -*-
module Dullness
  def Dullness.glitch(str)
    $KCODE = 'u'
    arr = str.tr('かきくけこさしすせそたちつてとはひふへほカキクケコサシスセソタチツテトハヒフヘホ',
                 'がぎぐげござじずせぞだぢづでどばびぶべぼガギグゲゴザジズゼゾダヂヅデドバビブベボ')
  end
end
