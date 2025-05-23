namespace ghzState {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Core;

    operation prepareGHZState(qubits : Qubit[]) : Unit is Adj + Ctl {
        let n = Length(qubits);
        
        H(qubits[0]);
        for i in 1 .. (n - 1) {
            CNOT(qubits[0], qubits[i]);
        }
    }

    operation runGHZ(n: Int) : Unit {
        use qubits = Qubit[n];

        prepareGHZState(qubits);

        for q in qubits {
            let res = M(q);
            Message($"Measured: {res}");
        }

        ResetAll(qubits);
    }
}