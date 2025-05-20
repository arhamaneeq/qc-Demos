namespace ghzState {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Core;

    operation prepareGHZState(n: Int, qubits : Qubit[]) : Unit is Adj + Ctl {
        H(qubits[0]);
        for i in 1 .. (n - 1) {
            CNOT(qubits[0], qubits[i]);
        }
    }

    operation runGHZ(n: Int) : Unit {
        use qubits = Qubit[n];

        prepareGHZState(n, qubits);

        for q in qubits {
            let res = M(q);
            Message($"Measured: {res}");
        }

        ResetAll(qubits);
    }
}