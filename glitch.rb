# -*- coding: utf-8 -*-
require 'rubygems'
require 'kconv'

class Glitch
  def str_methods
    ms = Array.new
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

end
