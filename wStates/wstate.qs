namespace wstate {
    import Std.Convert.IntAsDouble;
    import Std.Math.Sqrt;
    import Std.Math.ArcSin;

    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Core;

    operation applyWState(qubits : Qubit[]) : Unit is Adj + Ctl {
        let N = Length(qubits);

        if N == 1 {
            X(qubits[0])
        } else {
            let θ = 2.0 * ArcSin(1.0 / Sqrt(IntAsDouble(N)));

            Ry(θ, qubits[0]);
            X(qubits[0]);
            Controlled applyWState(qubits[0 .. 0], qubits[1 .. N - 1]);
            X(qubits[0]);
        }
    }

    operation runWState(n: Int) : Unit {
        use qubits = Qubit[n];

        applyWState(qubits);

        for q in qubits {
            let res = M(q);
            Message($"Measured: {res}");
        }

        ResetAll(qubits)
    }

}