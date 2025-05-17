namespace BellState {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;

    operation BellState(state : Int) : Result[] {
        use qubits = Qubit[2];
        mutable results = Result[2];

        if (state == 0) {
            H(qubits[0]);
            CNOT(qubits[0], qubits[1]);
        } elif (state == 1) {
            H(qubits[0]);
            CNOT(qubits[0], qubits[1]);
            Z(qubits[0]);
        } elif (state == 2) {
            X(qubits[0]);
            H(qubits[0]);
            CNOT(qubits[0], qubits[1]);
        } elif (state == 3) {
            X(qubits[0]);
            H(qubits[0]);
            CNOT(qubits[0], qubits[1]);
            Z(qubits[0]);
        }

        set results w/= 0 <- M(qubits[0]);
        set results w/= 1 <- M(qubits[1]);

        ResetAll(qubits);
        return results;
    }
}