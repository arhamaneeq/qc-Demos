import pennylane as qml

def createGHZCircuit(N):
    dev = qml.device("default.qubit", wires=N)

    @qml.qnode(dev)
    def circuit():
        qml.H(0)
        for i in range(1,N):
            qml.CNOT([0,i])

        return qml.state
        
    return circuit