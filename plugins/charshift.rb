# -*- coding: utf-8 -*-
module Charshift
  def Charshift.glitch(str)
    str.tr('abcdefghijklmnopqrstuvwxyz','bcdefghijklmnopqrstuvwxyza').
      tr('ABCDEFGHIJKLMNOPQRSTUVWXYZ','BCDEFGHIJKLMNOPQRSTUVWXYZA')
  end
end
