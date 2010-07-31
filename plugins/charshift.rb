# -*- coding: utf-8 -*-
module Charshift
  def Charshift.glitch(str)
    str.tr('あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん',
           'いうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをんあ').
      tr('アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラレルレロワヲン',
         'イウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラレルレロワヲンア').
      tr('がぎぐげござじずぜぞだぢづでどばびぶべぼ',
         'ぎぐげござじずぜぞだぢづでどばびぶべぼが').
      tr('ぱぴぷぺぽ','ぴぷぺぽぱ').
      tr('abcdefghijklmnopqrstuvwxyz','bcdefghijklmnopqrstuvwxyza').
      tr('ABCDEFGHIJKLMNOPQRSTUVWXYZ','BCDEFGHIJKLMNOPQRSTUVWXYZA')
  end
end
