#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'rubygems'
require 'twitter'
require 'kconv'
require 'yaml'

begin
  conf = YAML::load open(File.dirname(__FILE__) + '/config.yaml')
rescue
  STDERR.puts 'config.yaml load error'
  exit 1
end

message = ARGV.join(' ')
if message.size < 1
  STDERR.puts 'message if empty'
  exit 1
end

begin
  oauth = Twitter::OAuth.new(conf['consumer_key'], conf['consumer_secret'])
  oauth.authorize_from_access(conf['access_token'], conf['access_secret'])
  tw = Twitter::Base.new(oauth)
  tw.update(message[0...140])
rescue => e
  STDERR.pust e
end
  

