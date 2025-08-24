OPENQASM 3.0;
include "stdgates.inc";

input uint[32] N;
input uint[32] k;

qubit[N] q;
bit[N] c;

def dicke(qubit[n] q, uint[32] n, uint[32] k) {
    if (k == 0) {
        return;
    }

    if (k == n) {
        for i in [0:n-1] {
            x q[i];
        }

        return;
    }

    let p = float(k) / float(n);
    let theta = 2.0 * acos(sqrt(1 - p));

    ry(theta) q[0];

    ctrl @ dicke(q[1:], n-1, k-1) q[0];
    dicke(q[1:], n-1, k);
}

dicke(q, N, k);

for int i in [0 : N -1] {
    c[i] = measure q[i];
}

