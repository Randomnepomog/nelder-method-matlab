# nelder-method-matlab
Search for the minimum of an objective function in a multidimensional space using the Nelder–Mead method in MATLAB.
# Files 
Shape3d.m file contains a graphic representation of the function we use. That will help to make sure that our decision is indeed correct.
![image](https://github.com/Randomnepomog/nelder-method-matlab/assets/92563887/a3c4b004-0d6b-46ed-aaff-ef443da062de)

Function: 
![image](https://github.com/Randomnepomog/nelder-method-matlab/assets/92563887/d9fc462a-93af-4661-a60a-603e845c0512)

nelder.m file contains an algorithm that will search for that minimum.

# Intro
Note for the reader: Please, forgive me if you notice any bananas below. That text is a translation of my school work which originally was written in Russian language. And if you notice any bananas do not hesitate and write me an email or message here/LinkedIn/telegram. 
```
>Note for the reader:
>Please, forgive me if you notice any bananas below. That text is a translation of my school work which originally was written in Russian language. And if you notice any bananas do not hesitate and write me an email or message here/LinkedIn/telegram. 
```



The Nelder-Mead method is an extension of the simplex method by Spendley, Hext, and Himsworth. The convex hull of an (n+1)-equidistant point set in n-dimensional space is called a regular simplex. This configuration is considered in the Spendley, Hext, and Himsworth method. 
In two-dimensional space, a regular simplex is an equilateral triangle, and in three-dimensional space, it is a regular tetrahedron. The idea of the method is to compare the function values at the vertices of the simplex and move the simplex in the direction of the optimal 
point using an iterative procedure. In the original simplex method, a regular simplex was used at each stage. Nelder and Mead proposed several modifications of this method, allowing for irregular simplices. As a result, a very reliable direct search method was obtained, 
which is one of the most efficient for n⪯6.

The main features of the algorithm can be summarized as follows:

* The Nelder-Mead method does not impose restrictions on the smoothness of the function.
* This method is efficient when the computation of the minimized function is slow. Typically, the function value is calculated at no more than 3 points at each iteration.
* Lack of convergence theory. The algorithm may even diverge on smooth functions.

# Math problem setting

