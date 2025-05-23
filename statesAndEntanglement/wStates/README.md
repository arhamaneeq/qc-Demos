# W-States

The W-State, named after Wolfgang Dür, is one of the non-biseperable classes of multipartite entanglement, the other being GHZ states. WStates are constructed such that each non-zero amplitude state is composed of a bit string contain exactly a single `1`, with all other bits being `0`. The WState, unlike a GHZ which is maximally entangled, is *robust*, i.e., demonstrated entanglement in a fundamentally different manner. It is maximally robust, a single qubit measurement does not usually result in a seperable state. 

$$
|W_n\rangle = \frac{|10...0\rangle + |01...0\rangle + ... + |00...1\rangle}{\sqrt{n}}
$$

To implement a W-State on $n$ qubits, we notice that

$$
|W_n\rangle = \sqrt{\frac{n-1}{n}} |0\rangle|W_{n-1}\rangle + \frac{1}{\sqrt{n}}|1\rangle|0^{\otimes n - 1}\rangle
$$

We can use an RY gate which rotates a qubit around the Y axis of a block-sphere ($|0\rangle \mapsto \cos{\frac{\theta}{2}}|0\rangle + \sin{\frac{\theta}{2}}|1\rangle$) implying $\theta = 2\arcsin{\frac{1}{\sqrt{n}}}$, to generate the state

$$
\sqrt{\frac{n-1}{n}}|0\rangle|0^{\otimes n -1 }\rangle + \frac{1}{\sqrt{n}}|1\rangle|0^{\otimes n - 1}\rangle
$$

which allows us to recursively create the W State by applying the same algorithm by controlling on the first qubit.
