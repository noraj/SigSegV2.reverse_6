bytecode = File.binread('script.rbc')
instruction_from_byte_code = RubyVM::InstructionSequence.load_from_binary bytecode

# Eval the bytecode
# instruction_from_byte_code.eval

# Disassemble the bytecode
puts instruction_from_byte_code.disasm