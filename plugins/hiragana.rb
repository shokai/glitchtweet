# -*- coding: utf-8 -*-
module Hiragana
  def Hiragana.glitch(str)
    require 'jcode' rescue return str
    $KCODE = 'u'
    str.tr('ア-ン', 'あ-ん')
  end
end
