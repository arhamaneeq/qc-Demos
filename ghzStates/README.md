# GHZ States

A Greenberger-Horne-Zeillinger State is the natural extension of the Bell State to a system of $n$ qubits. These states are the canonical example of maximally entangled states in multipartite systems. For an $n$-qubit system, the GHZ state is defined as:

$$
|\text{GHZ}_n\rangle = \frac{|0^{\otimes n}\rangle + |1^{\otimes n}\rangle}{\sqrt[n]{2}} = \frac{|0...0\rangle + |1...1\rangle}{\sqrt[n]{2}}
$$This superposition exhibits perfect correlations across all qubits: measuring any single qubit instantly determines the measurement outcomes of all others. GHZ states allow demonstration of quantum nonlocality in a more striking way than Bell states, leading to stronger tests against local hidden variable theories. GHZ states serve as fundamental resources in multiparty quantum communication, secret sharing, and distributed quantum computation. 

The state is constructed using the Hadamard ($H$) gate on the first qubit, followed by a series of CNOT ($CX$) gates to generate entanglement between the qubits.

GHZ States underpin many important quantum information tasks, such as:
- *Quantum Secret Sharing*: Distributing quantum information among multiple parties such that only authorized subsets can reconstruct the secret.
- *Quantum Networks*: Serving as entanglement resources enabling coordination and synchronization across distant nodes.


