# Scilab Neural Network Module

Scilab Neural Network Module is a simple, pure Scilab implementation of neural network in matrix form. The algorithms are based on book "Neural Network Design" book by Martin T. Hagan. 

## Getting Started


### Prerequisites

1. This module is purely written in Scilab and hence does not require any external libraries. However, it works well with other Scilab module such as IPCV (https://atoms.scilab.org/toolboxes/IPCV/4.1). 


### Installing

The module could be easily install from the Scilab atoms portal by using command:

--> atomsInstall('neuralnetwork'); 

or the offline version by replacing the input argument to the zip file name.

If you prefer to build then module, download the source and unzip it, just type in scilab:

```
--> exec("neuralnetwork_Path/builder.sce")
```

If the module is place in the "contrib" folder, it could be loaded from the "Toolboxes" menu. Otherwise, just type in scilab:

``` 
--> exec("neuralnetwork_path/loader.sce"); 
```

neuralnetwork_Path is where this file is.

### EXAMPLES and DEMOS
 To see some examples, use the help function from Scilab console and run the examples from the help page.


## Features
The module could be used to build following netwroks
1. Perceptron
2. Adaline
3. Multilayer Feedforware Backpropagation Network
   - Gradient Decent
   - Gradient Decent with Adaptive Learning Rate
   - Gradient Decent with Momentum
   - Gradient Decent with Adaptive Learning Rate and Momentum
   - Levenberg–Marquardt
4. Competitive Network
5. Self-Organizing Map
6. LVQ1 Network

## Undocumented Features
1. Some new features still under development are located under macros\new folder

## Revisions

### REVISION NOTES 2.1
1. Uploaded to github

## To-Do
1. Generalization
2. RNN
3. Mini-batch processing
4. Rewrite functions to save models in an object for more flexibility
 

## Version

This is the Revision 2.1 of neural network module for Scilab 6.0.x

## Authors

Tan Chin Luh - ByteCode Malaysia

## License

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.


