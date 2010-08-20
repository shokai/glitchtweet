# -*- coding: utf-8 -*-
module Hirakata
  def Hirakata.glitch(str)
    require 'jcode' rescue return str
    $KCODE= 'u'
    return str.tr('あ-んア-ン', 'ア-ンあ-ん')
  end
end
