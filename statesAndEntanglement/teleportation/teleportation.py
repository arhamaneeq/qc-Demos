from qiskit import QuantumCircuit, QuantumRegister, ClassicalRegister, transpile
from qiskit_aer import Aer
from qiskit.quantum_info import Statevector

def createTeleporter(state: Statevector) -> QuantumCircuit:

    qreg = QuantumRegister(3)
    creg = ClassicalRegister(3)
    qc = QuantumCircuit(qreg, creg)

    qc.prepare_state(state, qreg[0])
    qc.barrier()

    qc.h(qreg[1])
    qc.cx(qreg[1],qreg[2])
    qc.cx(qreg[0],qreg[1])
    qc.h(qreg[0])
    qc.barrier()

    qc.measure([0,1], [0,1])

    with qc.if_test((creg[0], 1)):
        qc.x(qreg[2])
    with qc.if_test((creg[1], 1)):
        qc.z(qreg[2])

    qc.barrier()
    qc.measure([2], [2])

    return qc

p1 = 0.5**0.5
p2 = 0.5**0.5

circuit = createTeleporter(Statevector([p1 , p2]))
print(circuit.draw())