# -*- coding: utf-8 -*-
module Katakana
  def Katakana.glitch(str)
    require 'jcode' rescue return str
    $KCODE = 'u'
    str.tr('あ-ん', 'ア-ン')
  end
end
