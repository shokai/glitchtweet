# -*- coding: utf-8 -*-
module Speak
  def Speak.glitch(str)
    if rand > 0.5
      return "「#{str}」"
    else
      return "『#{str}』"
    end
  end
end
