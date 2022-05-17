# Basic Matlab scripts

## Basic Matlab commands
**Script**: `array_examples.m`

Contents: Arrays (no matrix-math ops)
1. Construction: direct, block methods, grid methods, Matlab functions
2. Operations (element-wise): arithmetic, comparison, functions, logical
3. Indexing and Slicing (vectors/matrices): single element access, range/slicing, index/selector vector, masked access
4. Size and Shape: length, size, numel, isscalar, isvector, ismatrix, isrow, iscolumn
5. Rearranging and reshapeing: transpose, sort, flip, reshape
6. Aggregate functions: statistical (min, max, mean, median, sum, prod, std, var, cumsum), and logial (all, any)
7. Matlab `find` function

## Functions
**Script**: `functions_script.m`

Contents:
1. Function calling
2. Function definition
3. Functions that works with scalar, vector and matrix inputs
4. Functions with no outputs
5. Functions with no inputs
6. Functions that require reshaping the inputs
7. Functions with outputs of the same shape as input
8. Functions with conditional execution and return
9. Function handles
10. Definition of anonymous functions (without names)
11. Functions with function handles as inputs
12. Functions with function handles as outputs

**Function file**: `math_function.m`

Contents:
1. Functions defined in their own .m function file
2. Local functions in _function files_

## Conditionals and Loops

**Script**: `cond_loops.m`

Contents:
1. `if`, `if-else`, `if-elseif-else` statements
2. Composite conditional expressions
3. Conditions involving vectors and arrays
4. Conditions involving array type: scalar, vector (row, column), matrix
5. `for` statements
6. Matrix construction, row-by-row and column-by-column loops
7. Looping over matrix row and columns

**Script**: `loops_seq.m`, **Application**: recurrences relations

Contents:
1. Store all elements of the sequence and pre-allocation
2. Store only last element
3. Applications: computing square root of a number, Fibonacci numbers, exponential function
4. `while` statements
5. Looping until convergence

## Plotting
**Script**: `plotting.m`

Contents:

1. Line plots
2. Scatter plots
3. Line and marker plots
4. Multiple plots in the same axis
5. Labels, Legend, Axis properties, Grid,  Axis ticks
6. Figures
7. Sub-plotting
8. Long form line/marker style properties
9. Saving a figure to an image file
10. Annotation: Lines, Shapes, Text, Arrows

## Systems of Linear Equations. Matrix Math
**Script**: `lse_matrix_math.m`

Contents:
1. Matrix Math: Matrix Product, Sum, Inverse, Power
2. Solving Systems of Linear Equations. Matlab function: `inv`, Left and Right Matrix Division
3. Examples

## Regression. Curve fitting
**Script**: `regression.m`

Contents:
1. Linear Regression
2. Polynomial Regression. Matlab Functions: `polyfit`, `polyval`
3. Prediction Error. Mean Square Error. Mean Absolute Error. Correlation Coefficient (linear regression)
4. General Regression

## Spline Interpolation
**Script**: `interpolation.m`

Contents:
1. Zeroth-order Spline Interpolation
2. Linear Interpolation. Matlab function: `interp1`
3. Natural Cubic Spline Interpolation. Matlab function: `spline`
4. Interpolation of 2D Curves

## Solving Algebraic Equations. Root Finding
**Script**: `root_finding.m`

Contents:
1. Bisection Method
2. Newton's Method
3. Secant method
4. Matlab function: `fzero`

## Numerical Differentiation and Integration
**Script**: `diff_int.m`

Contents:
1. Numerical Differentiation. Forward, Backward, and Central Methods
- Differentiation of a known function
- Differentiation when data is given
2. Numerical Integration. Trapezoid Method
- Integration of a known function
- Matlab function: `integral`
- Multiple dependent variables, one independent variable
- Integration when data is given
3. Polynomials - Integration and Differentiation. Matlab functions: `polyder`,
`polyint`

## Ordinary Differential Equations. ode45 and Euler's method
**Script**: `ode.m`

Contents:
1. Euler's Method
- Scalar case: one dependent variable
- Vector case: multiple dependent variables
2. Matlab function: `ode45`
- Scalar case: one dependent variable
- Vector case: multiple dependent variables
3. Systems with Inputs. Closed-loop control using proportional controller
