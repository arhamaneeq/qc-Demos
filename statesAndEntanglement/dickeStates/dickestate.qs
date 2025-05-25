namespace DickeState {
    import Std.Convert.IntAsDouble;
    import Std.Math.Sqrt;
    import Std.Math.ArcSin;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Core;

    operation SCS(qreg : Qubit[], k : Int) : Unit is Adj + Ctl {
        let N = Length(qreg);
        let Θ = 2.0 * ArcSin(Sqrt(IntAsDouble(k) / IntAsDouble(N)));

        if (k == 0) {
            // Do Nothing
        } elif (k == N) {
            for q in qreg {
                X(q)
            }
        } else {
            Ry(Θ, qreg[0]);

            Controlled SCS([qreg[0]], (qreg[1..], k - 1));
            X(qreg[0]);
            Controlled SCS([qreg[0]], (qreg[1..], k));
            X(qreg[0]);
        }
    }

    operation runDickeState(n: Int, k: Int) : Result[] {
        use qubits = Qubit[n];
        mutable results = Result[n];

        SCS(qubits, k);

        for i in 0..n - 1 {
            set results w/= i <- M(qubits[i]);
        }

        ResetAll(qubits);
        return results;

    }
}