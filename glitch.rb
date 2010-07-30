# -*- coding: utf-8 -*-
require 'rubygems'

class Glitch
  def str_methods
    ms = methods.delete_if{|m| !(m=~/^str_.+/) or m == 'str_methods' }.map{|m|
      method(m)
    }
    Dir.glob(File.dirname(__FILE__)+'/plugins/*.rb').each{|lib|
      require lib
      name = lib.split(/\//).last.split(/\./).first.capitalize
      ms << eval("#{name}.method('glitch')")
    }
    ms
  end

  def glitch(str, method=nil)
    if method == nil
      ms = str_methods
      method = ms[rand(ms.size)]
    end    

    ignore = /(https?\:[\w\.\~\-\/\?\&\+\=\:\@\%\;\#\%]+)|(@[a-zA-Z0-9_]+)|(#[a-zA-Z0-9_\-]+)/
    str.split(ignore).map{|s|
      if s =~ ignore or s.size < 1
        result = " #{s} "
      else
        result = method.call(s)
      end
      result
    }.join('').chomp.strip
  end

  def str_reverse(str)
    str.split(//u).reverse.join('')
  end

  def str_add_space(str)
    str.split(//u).join(' ')
  end

  def str_double(str)
    str + ' ' + str
  end

  def str_fill_140(str)
    len = str.split(//u).size
    result = ''
    (140/len).times do
      result += str
    end
    result.chomp.strip
  end

  def str_ignore_search(str)
    str.split(//u).join('/')
  end
  
  def str_atai(str)
    "＼#{str}／"
  end

  def str_katakana(str)
    require 'jcode' rescue return str
    $KCODE = 'u'
    str.tr('あ-ん', 'ア-ン')
  end

  def str_vertical_reverse(str)
    require 'jcode' rescue return str
    $KCODE = 'u'
    str.downcase.tr('abcdefghijklmnopqrstuvwxyz', 'ɐqɔpǝɟbɥıظʞ1ɯuodbɹsʇnʌʍxʎz')
  end

  def str_hiragana(str)
    require 'jcode' rescue return str
    $KCODE = 'u'
    str.tr('ア-ン', 'あ-ん')
  end
  
  def str_hirakata(str)
    require 'jcode' rescue return str
    $KCODE= 'u'
    return str.tr('あ-んア-ン', 'ア-ンあ-ん')
  end

  def str_cmabridge(str)
    require 'MeCab' rescue return str
    strs = MeCab::Tagger.new.parse(str).map{|i|
      i.split(/\t/).first
    }.delete_if{|i|
      i =~ /^EOS/
    }.map{|i|
      tmp = i.split(//u)
      if tmp.size > 2
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

  def str_line_prefix(str)
    '─'*3 + '─'*rand(6)+str
  end
  
  def str_kirakira(str)
    arr = "☆ .。.:* .。.:*･ﾟ∞∮+'∮+'★*｡.::･'ﾟ｡.::･'ﾟ｡.:*:･'ﾟ".split(//u)
    count = 0
    last = nil
    kira = ""
    loop do
      c = arr[rand(arr.size)]
      next if last == c
      kira += c
      last = c
      count += 1
      break if count > 8 and rand < 0.1
    end
    kira + str + kira.split(//u).reverse.join('')
  end

end
