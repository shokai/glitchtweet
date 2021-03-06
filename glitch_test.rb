#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require File.dirname(__FILE__)+'/glitch'

g = Glitch.new
p g.str_methods

samples = ['@foo ああ眠い',
           'プルアップ抵抗の選び方 http://example.com',
           '自分で整理しなくて良い',
           'hello hello @bar has published 50+ papers in international journals, conferences and scientific workshops',
           'コンビニいこうぜ',
           'http://kaomojiya.com/ の顔文字全部取り込んだ']
samples << ARGV.join(' ') if ARGV.size > 0


samples.each{|str|
  puts '='*5 + str + '='*5
  for m in g.str_methods do
    result, method = g.glitch(str, m)
    puts "#{method.to_s} : #{result}"
  end
}

if ARGV.size > 0
  str = ARGV.join(' ').to_s
  puts '='*5 + str + '='*5
  puts random = g.glitch(str)
  puts random = g.glitch(random.first)
  puts random = g.glitch(random.first)
end
