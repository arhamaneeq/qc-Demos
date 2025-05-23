import pennylane as qml
import numpy as np

def createWStateCircuit(N):
    dev = qml.device("default.qubit", wires=N)

    @qml.qnode(dev)
    def circuit():
        applyWState(list(range(N)))
        return qml.state()
    
    return circuit


def applyWState(qreg):
    N = len(qreg)

    if (N == 1):
        qml.X(qreg[0])
    else:
        θ = 2 * np.arcsin(1 / np.sqrt(N))
        qml.RY(θ, wires = qreg[0])
        qml.CNOT(wires = [qreg[0], qreg[1]])

        applyWState(qreg[1:])
