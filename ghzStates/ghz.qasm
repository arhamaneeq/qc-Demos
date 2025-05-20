OPENQASM 3;

input uint[32] n;

qubit[n] q;
bit[n] c;

h q[0];

for i in [1:n-1] {
    cx q[0], q[i];
}

for i in [0:n-1] {
    c[i] = measure q[i];
}