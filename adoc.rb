#!/usr/bin/env ruby
# Outputs simple documentation of aliases file provided
# Shows expansion of alias or first line of functions

alias_pattern = /^alias ([^=]+)=["']([^"']+)["']$/
function_pattern = /^(\w+)\s?\(\)\s?{$/
aliases = {}

function_name = nil

ARGF.each_line do |line|
  match_data = line.match(alias_pattern)# || line.match(function_pattern)
  if match_data
    alias_name = match_data[1]
    expansion = match_data[2]
    aliases[alias_name] = expansion
  elsif match_data = line.match(function_pattern)
    function_name = match_data[1]
  elsif function_name
    aliases[function_name] = line[/^\s+(.+)$/, 1]
    function_name = nil
  end
end

sorted_aliases = aliases.sort.to_h

sorted_aliases.each do |alias_name, expansion|
  printf("#{alias_name}\t#{expansion}\n")
end
