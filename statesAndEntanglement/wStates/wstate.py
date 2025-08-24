from qiskit import QuantumCircuit, transpile
from qiskit_aer import Aer
import numpy as np

def createWStateCircuit(N):
    circuit = QuantumCircuit(N)

    applyWState(circuit, list(range(N)))
                
    return circuit

def applyWState(qc: QuantumCircuit, qreg):
    N = len(qreg)

    if (N==1):
        qc.x(qreg[0])
    else:
        θ = 2 * np.arccos(np.sqrt((N - 1) / N))
        qc.ry(θ, qreg[0])
        qc.cx(qreg[0], qreg[1])

        applyWState(qc, qreg[1:])

qc = createWStateCircuit(5)
print(qc.draw())