#TODO: figure what the FUCK is wrong with qiskit version control


circuit = QuantumCircuit(2, 2)
circuit.h(0)
circuit.cx(0, 1)
circuit.measure([0,1], [0,1])

print(circuit.draw())

backend = Aer.get_backend("qasm_simulator")
result = execute(circuit, backend, shots = 1024)

print(result.get_counts())