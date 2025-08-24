from qiskit import QuantumCircuit, transpile
from qiskit_aer import Aer
import numpy as np

def applySCS(N: int, k:int ) -> QuantumCircuit:
    qc = QuantumCircuit(N)

    if k == 0:
        return qc
    if k == N:
        for q in range(N):
            qc.x(q)
        return qc
    
    θ = 2 * np.arcsin(np.sqrt(k/N))
    qc.ry(θ, 0)

    sub1 = applySCS(N - 1, k - 1).to_gate()
    sub2 = applySCS(N - 1, k).to_gate()

    qc.append(sub1.control(1), [0] + list(range(1, N)))
    qc.x(0)
    qc.append(sub2.control(1), [0] + list(range(1, N)))
    qc.x(0)

    return qc
    
def createDickeStateCircuit(N, k):
    circuit  = applySCS(N, k)
    circuit.name = f"Dicke({N}, {k})"

    return circuit

qc = createDickeStateCircuit(3, 2)
print(qc.draw())