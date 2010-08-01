# -*- coding: utf-8 -*-
require 'rubygems'
require 'kconv'

class Glitch
  def str_methods
    ms = methods.delete_if{|m| !(m=~/^str_.+/) or m == 'str_methods' }.map{|m|
      method(m)
    }
    Dir.glob(File.dirname(__FILE__)+'/plugins/*.rb').each{|lib|
      name = lib.split(/\//).last.split(/\./).first.capitalize
      ms << [lib, name]
    }
    ms
  end

  def glitch(str, method=nil)
    if method == nil
      ms = str_methods
      method = ms[rand(ms.size)]
    end
    if method.class == Array
      require method[0]
      method = eval("#{method[1]}.method('glitch')")
    end
    ignore = /(https?\:[\w\.\~\-\/\?\&\+\=\:\@\%\;\#\%]+)|(@[a-zA-Z0-9_]+)|(#[a-zA-Z0-9_\-]+)/
    result = str.toutf8.split(ignore).map{|s|
      if s =~ ignore or s.size < 1
        result = " #{s} "
      else
        result = method.call(s)
      end
      result
    }.join('').chomp.strip.toutf8
    return result, method
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
    a = 'abcdefghijklmnopqrstuvwxyz'.split(//u)
    b = 'ɐqɔpǝɟbɥıظʞ1ɯuodbɹsʇnʌʍxʎz'.split(//u)
    str.split(//u).map{|i|
      if a.include?(i)
        i = b[a.index(i)]
      end
      i
    }.join('')
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

  def str_line_prefix(str)
    '─'*3 + '─'*rand(6)+str
  end

  def str_double_char(str)
    result = ''
    str.split(//u).each{|c|
      if c =~ /[ 　\t]/
        result += c
      else
        result += c*2
      end
    }
    result
  end
  
end
