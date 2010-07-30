#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require File.dirname(__FILE__)+'/glitch'

g = Glitch.new
p g.str_methods

samples = ['@foo ああ眠い', 'プルアップ抵抗の選び方 http://example.com', '自分で整理しなくて良い', 'hello hello @bar has published 50+ papers in international journals, conferences and scientific workshops']


samples.each{|str|
  puts '='*5 + str + '='*5
  for m in g.str_methods do
    puts m + ' : ' + g.glitch(m, str)
  end
}

if ARGV.size > 0
  str = ARGV.join(' ')
  puts '='*5 + str + '='*5
  puts random = g.glitch(:random, str)
  puts g.glitch(:random, random)
end
