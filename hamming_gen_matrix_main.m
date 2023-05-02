function main()
    num_bits = input('Digite o número de bits de dados (k): ');
    generator_matrix = hamming_gen_matrix_functions(num_bits);
    disp(['Matriz geradora G para k = ', num2str(num_bits), ' e r = ', num2str(ceil(log2(num_bits+1))), ':']);
    disp(generator_matrix);
end

