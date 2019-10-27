byte_code = RubyVM::InstructionSequence.compile_file 'script.rb'

File.binwrite 'script.rbc', byte_code.to_binary