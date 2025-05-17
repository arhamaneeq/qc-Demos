#TODO: figure what the FUCK is wrong with qiskit version control

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

backend = Aer.get_backend("qasm_simulator")
result = execute(qc, backend, shots = 1024)

print(result.get_counts())