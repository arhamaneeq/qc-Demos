OPENQASM 3.0;
include "stdgates.inc";

input int N;
qubit[N] q;
bit[N] c;

def θ(int k, int N) -> angle {
    return 2.0 * acos(sqrt(float(N - k) / float(N - k + 1)))
}

for int k in [0 : N - 2] {
    ry(θ(k, N)) q[k];
    cx q[k], q[k+1];
}

x q[N - 1];

for int i in [0 : N - 1] {
    c[i] = measure q[i];
}