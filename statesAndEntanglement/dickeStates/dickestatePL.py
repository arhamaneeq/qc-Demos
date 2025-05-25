import pennylane as qml
import numpy as np

def applySCS(qreg, k):
    N = len(qreg)
    Θ = 2 * np.arcsin(np.sqrt(k/N))

    if k == 0:
        return
    if k == N:
        for q in qreg:
            qml.X(q)
        return

    qml.RY(Θ, wires=qreg[0])

    qml.ctrl(applySCS, control=qreg[0])(qreg[1:], k - 1)

    qml.X(qreg[0])
    qml.ctrl(applySCS, control=qreg[0])(qreg[1:], k)
    qml.X(qreg[0])

def createDickeStateCircuit(N, k):
    dev = qml.device("default.qubit", wires=N)

    @qml.qnode(dev)
    def circuit():
        applySCS(list(range(N)), k)
        return qml.state()
    
    return circuit



    

    