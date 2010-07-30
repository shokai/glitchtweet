# -*- coding: utf-8 -*-
class Glitch
  def str_methods
    methods.delete_if{|m| !(m=~/^str_.+/) or m == 'str_methods' }.map{|m|
      m.scan(/^str_(.+)/).first.first
    }
  end

  def glitch(method_name, str)
    if method_name.to_s == 'random'
      ms = str_methods
      m = method("str_#{ms[rand(ms.size)]}")
    else
      m = method("str_#{method_name}")
    end    

    ignore = /(https?\:[\w\.\~\-\/\?\&\+\=\:\@\%\;\#\%]+)|(@[a-zA-Z0-9_]+)|(#[a-zA-Z0-9_\-]+)/
    str.split(ignore).map{|s|
      if s =~ ignore or s.size < 1
        result = " #{s} "
      else
        result = m.call(s)
      end
      result
    }.join('').chomp.strip
  end

  def str_plain(str)
    str
  end

  def str_reverse(str)
    str.split(//u).reverse.join('')
  end

  def str_add_space(str)
    str.split(//u).join(' ')
  end

  def str_double(str)
    str*2
  end

  def str_ignore_search(str)
    str.split(//u).join('/')
  end
  
  def str_atai(str)
    "＼#{str}／"
  end

  def str_katakana(str)
    require 'jcode'
    $KCODE = 'u'
    str.tr('あ-ん', 'ア-ン')
  end

  def str_hiragana(str)
    require 'jcode'
    $KCODE = 'u'
    str.tr('ア-ン', 'あ-ん')
  end

  def str_hirakata(str)
    require 'jcode'
    $KCODE= 'u'
    str.tr('あ-んア-ン', 'ア-ンあ-ん')
  end

  def str_line_prefix(str)
    '─'*rand(6)+str
  end
  
end
