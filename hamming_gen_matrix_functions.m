function [generator_matrix] = hamming_gen_matrix_functions(num_bits)
    r = ceil(log2(num_bits + 1));

    data_positions = get_data_positions(r, num_bits + r);
    parity_positions = get_parity_positions(r);

    I_k = eye(num_bits);
    P = generate_parity_matrix(num_bits, r, data_positions, parity_positions);
    generator_matrix = [I_k, P];
end

function [data_positions] = get_data_positions(r, n)
    data_positions = [];
    for i = 1:n
        if ~is_power_of_two(i)
            data_positions = [data_positions, i];
        end
    end
end

function [parity_positions] = get_parity_positions(r)
    parity_positions = 2 .^ (0:(r - 1));
end

function [is_power] = is_power_of_two(x)
    is_power = (x ~= 0) && (bitand(x, (x - 1)) == 0);
end

function [P] = generate_parity_matrix(num_bits, r, data_positions, parity_positions)
    P = zeros(num_bits, r);
    for i = 1:length(data_positions)
        for j = 1:length(parity_positions)
            if bitand(data_positions(i), parity_positions(j)) ~= 0
                P(i, j) = 1;
            end
        end
    end
end
