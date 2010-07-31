# -*- coding: utf-8 -*-
module Cmabridge
  def Cmabridge.glitch(str)
    require 'MeCab' rescue return str
    strs = MeCab::Tagger.new.parse(str).map{|i|
      i.split(/\t/).first
    }.delete_if{|i|
      i =~ /^EOS/
    }.map{|i|
      tmp = i.split(//u)
      if tmp.size > 1
        a = rand(tmp.size-1)
        b = a+1
        x = tmp[a]
        tmp[a] = tmp[b]
        tmp[b] = x
        res = tmp.join('')
      else
        res = i
      end
      res
    }
    for i in 0...strs.size-1 do
      if strs[i] =~ /^[ -~｡-ﾟ]*$/ and strs[i+1] =~ /^[ -~｡-ﾟ]*$/
        strs[i] = strs[i]+' '
      end
    end
    strs.join('')
  end
end
