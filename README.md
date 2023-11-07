
# nelder-method-matlab
Search for the minimum of an objective function in a multidimensional space using the Nelder–Mead method in MATLAB.
# Files 

`Shape3d.m` file contains a graphic representation of the function we use. That will help to make sure that our decision is indeed correct.

![image](https://github.com/Randomnepomog/nelder-method-matlab/assets/92563887/a3c4b004-0d6b-46ed-aaff-ef443da062de)

# Function: 
![image](https://github.com/Randomnepomog/nelder-method-matlab/assets/92563887/d9fc462a-93af-4661-a60a-603e845c0512)

The `nelder.m` file contains an algorithm that will search for that minimum.

# Intro


> Note for the reader:
> Please forgive me if you notice any bananas below. That text is a translation of my school work, which originally was written in Russian language. And if you see any bananas do not hesitate and write me an email or message here/LinkedIn/telegram. 




The Nelder-Mead method is an extension of the simplex method by Spendley, Hext, and Himsworth. The convex hull of an (n+1)-equidistant point set in n-dimensional space is called a regular simplex. This configuration is considered in the Spendley, Hext, and Himsworth method. 
In two-dimensional space, a regular simplex is an equilateral triangle, and in three-dimensional space, it is a regular tetrahedron. The idea of the method is to compare the function values at the vertices of the simplex and move the simplex in the direction of the optimal 
point using an iterative procedure. In the original simplex method, a regular simplex was used at each stage. Nelder and Mead proposed several modifications of this method, allowing for irregular simplices. As a result, a very reliable direct search method was obtained, 
Which is one of the most efficient for n⪯6.

The main features of the algorithm can be summarized as follows:

* The Nelder-Mead method does not impose restrictions on the smoothness of the function.
* This method is efficient when the computation of the minimized function is slow. Typically, the function value is calculated at most 3 points at each iteration.
* Lack of convergence theory. The algorithm may even diverge on smooth functions.

# Math problem setting

An optimization problem is defined as the task of finding the extremum (maximum or minimum) of a function defined over a particular set or domain. 

$f: \mathbb{X}\ \rightarrow \mathbb{R}\$

$f(x) \rightarrow \min, x \in \mathbb{X} 

Generally, an optimization problem also implies the search for an element x, typically a point or set of values, at which the objective function (often denoted as 
 $f(x)$ ) reaches an extremum (either a maximum or a minimum).
 
$x_0=\{argmin}_{x \in \mathbb{X}} f(x), \mathbb{X} \subseteq \mathbb{G}$ 



To properly formulate an optimization problem, you need to specify the following:

* Feasible set. $\mathbb{X}$

* Objective function. $f: \mathbb{X} \rightarrow \mathbb{R}$

* Search criterion (max or min).

To solve problem $f(x) \rightarrow \min_{x \in \mathbb{X}}$ we need to:
1. Show that $\mathbb{X} = \emptyset$
2. Show that objective function $f(x)$ is not limited
3. Find $x_*$
4. If $x_*$ doesn't exist we need to find $\inf _{x \in \mathbb{X}} f(x)$
   
If the feasible set is $\mathbb{X} = \mathbb{G}$, then such a problem is called an unconstrained optimization problem; otherwise, it is referred to as a constrained optimization problem.

# Current problem

The Nelder-Mead method, also known as the simplex method, is an unconstrained optimization method for real-valued functions of multiple variables. In other words, the following constraints are imposed on the feasible set:

$\mathbb{X}\=\mathbb{G}\=\mathbb{R}^n$

One of the main advantages of this method is that it does not rely on the gradient of the objective function, making it applicable to non-smooth functions. The Nelder-Mead method utilizes the concept of a simplex in $n$-dimensional space.

A set $\mathnormal{C}$ is called convex if $\forall\ a,b\in\mathnormal{C}\ [a,b] \subseteq \mathnormal{C}$ .

The convex hull of a set $\mathbb{X}$ is defined as the smallest convex set $\mathnormal{C}$ where $\mathnormal{C}\subseteq \mathnormal{C}$
A simplex, or an $n$-simplex, is a convex hull of $(n+1)$ points.
For example:

* A 1-simplex is a line segment.
* A 2-simplex is a triangle.
* A 3-simplex is a tetrahedron.

# Description of the Method
The parameters of the method include:
* Reflection coefficient $\alpha > 0$ , usually chosen as 1.
* Compression coefficient $\beta >0$ , typically set to 0.5.
* Expansion coefficient $\gamma >0$, usually chosen as 2.
# Initialization: 
Randomly selected $n+1$ point $x_i = (x_i^1 , x_i^2 , ... , x_i^n )$ to form an n-dimensional simplex. At those points, we need to apply this function: 
$f_1 = f(x_i^1) , f_2 = f(x_i^2),..,f_n+1 = f(x_i^n+1)$
### 1. Sorting: 
Select three points from the simplex: $x_h$ with the highest (from selected) function value $f_h$, $x_g$ with next from the highest function value $f_g$, and $x_l$ with the lowest function value $f_l$. Our goal is at least to reduce $f_h$.
### 2. Center of gravity:
Finding the center of gravity of all the points, except $x_h:x_c = \frac{1}{n} \sum_{i\neq 1} x_i  $. Calculation of $f_c = f(x_c)$ is not necessary.
### 3. Reflection:
We need to reflect point $x_h$ with respect to $x_c$ with coefficient $\alpha$(if $\alpha = 1$, this is central symmetry; otherwise, homothety), and we get a new point $x_r$ which we use to get a new function value $f_r = f(x_r)$. Coordinates of the new point should be calculated by using the formula $x_r = (2+\alpha)x_c - \alpha x_h$
### 4. Comparing.
Comparing function value $f_c$ with $f_h, f_g, f_l$:
#### 4a.
If $f_r < f_l$, we need to make a stretch. The new point will be $x_e = (1-\gamma)x_c + \gamma x_r$, which means that the new function value is $f_e = f(x_e)$.
Then, if $f_e < f_l$, we need to replace $x_h$ with $x_e$ and continue with step 8.
If $f_e > f_l$, we need to replace $x_h$ with $x_r$ and continue with step 8.
#### 4b.
If $f_l < f_r < f_g$, we need to replace $x_h$ with $x_r$ and continue with step 8.
#### 4c.
If $f_h > f_r > f_g$, we need to switch $x_r$ and $x_h$ and continue with step 5.
#### 4d.
If $f_r > f_h$, we  continue with step 5.
#### 5. Compression:
Building the point $x_s = \beta x_h + (1 - \beta)x_c$ and calculating $f_s$.
#### 6. 
If $f_s < f_h$, we need to replace $x_h$ with $x_s$ and continue with step 8. 
#### 7. 
If $f_s > f_h$, we need to compress the simplex - homothety to the point with the smallest value $x_0 : x_i \to x_0 + (x_i - x_0)/2$ 
#### 8. Checking convergence.
It can be done in various ways, for example, by estimating the variance of the set of points. The essence of the check is to verify the mutual proximity of the obtained simplex vertices, which implies their proximity to the desired minimum. If the required accuracy is not achieved, you can continue with iterations from step 1.
# Method analysis

Studying the convergence of the Nelder-Mead algorithm is a challenging mathematical task. Known results regarding the convergence of simplex methods are based on the following assumptions:
▪ The simplex should not degenerate during the algorithm's iterations.
▪ Some conditions are imposed on the smoothness of the function.

In the general case, both of these assumptions are not immediately satisfied for the Nelder-Mead method, and therefore, more needs to be known about the convergence conditions. In 1998, MacKinnon described a family of strictly convex functions and a class of initial simplices in two-dimensional space, for which all the vertices of the working simplex do not converge to the optimal point. In 1998, Lagarias published a paper in which he investigated the convergence of the method in one- and two-dimensional spaces for some strictly convex functions with bounded level surfaces.

The Nelder-Mead algorithm significantly reduces the function value in the first few iterations and quickly reaches the required accuracy. Typically, the algorithm performs one or two function evaluations per iteration, excluding compression, which is rarely used in practice. This is crucial when evaluating function values is very costly or time-consuming. For such tasks, the Nelder-Mead algorithm is much more efficient than many other methods that require evaluating no fewer than function values at each iteration.

The main advantages of the algorithm are its simplicity and efficiency.

On the other hand, due to the lack of convergence theory, the method can lead to incorrect answers even for smooth functions in practice. It is also possible that the working simplex is far from the optimal point, and the algorithm performs many iterations with little change in the function value. Heuristically solving this problem involves running the algorithm several times and limiting the number of iterations.

