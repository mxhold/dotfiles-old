#!/usr/bin/env ruby
# Outputs list of aliases/functions from file provided

alias_pattern = /^alias ([^=]+)=["']([^"']+)["']$/
comment_pattern = /^(#.+)$/
function_pattern = /^(\w+)\s?\(\)\s?{$/
aliases = {}

comment = nil

ARGF.each_line do |line|
  match_data = line.match(alias_pattern) || line.match(function_pattern)
  comment_match = line.match(comment_pattern)
  
  if match_data
    alias_name = match_data[1]
    
    if comment
      aliases[alias_name] = comment
      comment = nil
    else
      expansion = match_data[2]
      aliases[alias_name] = expansion
    end
  elsif comment_match
    comment = comment_match[1]
  end
end

sorted_aliases = aliases.sort.to_h

sorted_aliases.each do |alias_name, expansion|
  printf("#{alias_name}\t#{expansion}\n")
end
