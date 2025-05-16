namespace BellState {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;

    operation BellState() : (Result, Result) {
        using (qubits = Qubit[2]) {
            H(qubits[0]);
            CNOT(qubits[0], qubits[1]);

            let result0 = M(qubits[0]);
            let result1 = M(qubits[1]);

            ResetAll(qubits);
            return (result0, result1);
        }
    }
}