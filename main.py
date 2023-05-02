import numpy as np
import math

def is_power_of_two(x):
    return x != 0 and (x & (x - 1)) == 0

def get_parity_positions(r):
    return [2 ** i for i in range(r)]

def get_data_positions(r, n):
    return [i for i in range(1, n + 1) if not is_power_of_two(i)]

def generate_identity_matrix(size):
    return np.eye(size, dtype=int)

def generate_parity_matrix(k, r, data_positions, parity_positions):
    P = np.zeros((k, r), dtype=int)

    for i, data_pos in enumerate(data_positions):
        for j, parity_pos in enumerate(parity_positions):
            if data_pos & parity_pos != 0:
                P[i, j] = 1

    return P

def generate_generator_matrix(k, r):
    data_positions = get_data_positions(r, k + r)
    parity_positions = get_parity_positions(r)

    I_k = generate_identity_matrix(k)
    P = generate_parity_matrix(k, r, data_positions, parity_positions)
    G = np.hstack((I_k, P))

    return G

def main():
    k = int(input("Digite o número de bits de dados (k): "))
    r = int(math.ceil(math.log2(k + 1)))

    generator_matrix = generate_generator_matrix(k, r)
    print(f"Matriz geradora G para k = {k} e r = {r}:")

    for row in generator_matrix:
        print(" ".join(map(str, row)))
    np.savetxt('matriz_geradora.txt', generator_matrix, fmt='%d')

if __name__ == "__main__":
    main()

