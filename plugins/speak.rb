# -*- coding: utf-8 -*-
module Speak
  def Speak.glitch(str)
    speaks = [
           ['「','」'],
           ['『','』'],
           ['(',')'],
           ['（','）']
          ]
    tmp = speaks.choice
    "#{tmp[0]}#{str}#{tmp[1]}"
  end
end
