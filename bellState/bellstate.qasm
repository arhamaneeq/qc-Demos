OPENQASM 3.0;
include "stdgate.inc";

input uint[2] bell_id; // 0 => Φ+ ; 1 => Φ- ; 2 => Ψ+ ; 3 => Ψ-

qubit[2] q;
bit[2] c;

if (bell_id == 0) {
    h q[0];
    cx q[0], q[1];
}

if (bell_id == 1) {
    h q[0];
    cx q[0], q[1];
    z q[0];
}

if (bell_id == 2) {
    x q[0];
    h q[0];
    cx q[0], q[1];
}

if (bell_id == 3) {
    x q[0];
    h q[0];
    cx q[0], q[1];
    z q[0]
}

c[0] = measure q[0]
c[1] = measure q[1]