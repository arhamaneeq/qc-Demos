# Dicke States

Dicke States, named after Robert Dicke, are a generalisation still of W-States, and are defined as the equal superposition of all computational basis states with a fixed Hamming weight $k$, and are denoted $|D_k^n\rangle$ and form a foundational class of symmetric multipartite entangled states.

$$
|D_k^n\rangle = \frac{1}{\sqrt{{n}\choose{k}}} \sum_{w(x)=k}|x\rangle
$$
where $w(x)$ is the Hamming weight of a bitstring $x$ of length $n$. That is, Dicke States are uniform superpositions over all $n$-qubit basis states with exactly $k$-excitations. 

We can utilise the following decomposition to construct a Dicke State.
$$
|D_k^n\rangle = \sqrt{\frac{k}{n}}|D_{k-1}^{n-1}\otimes|1\rangle + \sqrt{\frac{n-k}{n}}|D_l^{n-1}\rangle\otimes|0\rangle
$$

We design the unitary $U$ such that $|0\rangle^{\otimes n-k}|1\rangle^{\otimes k} \mapsto |D_k^n\rangle$ by composing it out of a transformation denoted the *split-&-cyclic-shift* unitary, $SCS_{n,k}$. 

We use an $R_y$ to split the first qubit with $\theta = 2\arcsin{\sqrt{\frac{k}{n}}}$, and then apply $SCS$ on the remaining qubits under control of the first.