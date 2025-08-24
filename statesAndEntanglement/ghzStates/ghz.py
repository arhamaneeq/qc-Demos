from qiskit import QuantumCircuit, transpile
from qiskit_aer import Aer

def createGHZCircuit(N):

    circuit = QuantumCircuit(N)

    circuit.h(0)
    for i in range(1, N):
        circuit.cx(0, i)

    return circuit

qc = createGHZCircuit(5)
print(qc.draw())


