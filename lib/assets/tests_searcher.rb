require 'find'
require 'active_support/core_ext/string'
# searcher for tests in singular and plural names


def prepare_paths folders_to_include
  folders_to_include.flat_map do |folder|
    Dir.glob("test/#{folder}**/*_test.rb")
  end
end

def plurality_maker file_name
  word_pair = (file_name.pluralize == file_name ? [file_name.singularize, file_name] : [file_name, file_name.pluralize])
  if word_pair[1].include? word_pair[0]
    word_pair.tap { |pair| pair.delete_at 1 }
  elsif word_pair[0].include? word_pair[1]
    word_pair.tap { |pair| pair.delete_at 0 }
  else
    word_pair
  end
end 

def prepare_test_path file_name, *folders_to_include
  paths_to_check = prepare_paths folders_to_include
  word_pair = plurality_maker file_name
  word_pair.flat_map do |word|
    paths_to_check.select { |path| path.match? /#{word}/ }
  end
end 
