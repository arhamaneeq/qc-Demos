from qiskit import QuantumCircuit
from qiskit_aer import Aer
from qiskit import transpile

def bellCircuit(state):

    circuit = QuantumCircuit(2, 2)

    if (state == 'Φ+'):
        circuit.h(0)
        circuit.cx(0, 1)
    elif (state == 'Φ-'):
        circuit.h(0)
        circuit.cx(0, 1)
        circuit.z(0)
    elif (state == 'Ψ+'):
        circuit.x(0)
        circuit.h(0)
        circuit.cx(0, 1)
    elif (state == "Ψ-"):
        circuit.x(0)
        circuit.h(0)
        circuit.cx(0, 1)
        circuit.z(0)

    circuit.measure([0,1], [0,1])

    return circuit

qc = bellCircuit("Φ+")

print(qc.draw())

sim = Aer.get_backend("qasm_simulator")
com = transpile(qc, sim)
result = sim.run(com, shots=1000).result()

print(result.get_counts())