# -*- coding: utf-8 -*-
module Lineprefix
  def Lineprefix.glitch(str)
    '─'*3 + '─'*rand(6)+str
  end
end
