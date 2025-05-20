# The Bell States

Quantum computing is fundamentally built on the principles of linear algebra. At the heart of this framework lies the statevector, a mathematical object that encodes the current configuration of a quantum system. However, this vector is always defined relative to a basis, and the choice of basis is far from arbitrary — it plays a critical role in how quantum circuits compute, how information is extracted, and how desired behaviors are enforced. 

The traditional choice is defining the `|0>` and `|1>` bases with respect to measurement defined by the Paulli-Z operator, which for a two qubit system generates the orthonormal basis set: 
```
|00>, |01>, |10>, |11>
```

But this is not the only valid or useful basis. By applying Hadamard and CNOT gates to the computational basis, we can construct an alternative set of orthonormal basis states known as the Bell states. These are not only orthogonal but also maximally entangled with respect to the computational basis. The four Bell states are:
![Bell state](https://latex.codecogs.com/png.image?\dpi{120}\large|\Phi^+\rangle=\frac{|00\rangle+|11\rangle}{\sqrt{2}})
$$
|\Phi^-\rangle = \frac{|00\rangle - |11\rangle}{\sqrt{2}}
$$
$$
|\Psi^+\rangle = \frac{|01\rangle + |10\rangle}{\sqrt{2}}
$$
$$
|\Psi^-\rangle = \frac{|01\rangle - |10\rangle}{\sqrt{2}}
$$

These states form an alternative basis for the two-qubit Hilbert space and serve as fundamental resources for many quantum algorithms and protocols, including quantum teleportation, superdense coding, and quantum key distribution.

