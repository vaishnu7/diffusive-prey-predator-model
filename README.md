# Spatial Prey Predator Model

In this referred paper (look for the description link of this repository) the authors presented the general spatial predator-prey model that will be analyzed throughout their work.
The model is defined in the one-dimensional spatial-temporal domain (0, L) x (0, T] (refer to the equation number 1 in the paper)
The functions R and C are the densities of prey and predator respectively, and the prey grows according to a logistic equation.

Among the two considered models based on a set of spatial predator-prey models in biological pest control, this repository contains results for _**type 2 functional response only**_ (refer to equation 3 in the paper). In these relations, a_(CR) is the attack coefficient of species C on species R and T_(hCR) is the manipulation time of species C on species R.

The following graph shows the Steady-state spatial distribution of predator resulting from model simulations with type 2 functional response for two values of the per capita mortality rate of the predator (mC = 0.0201 and mC = 0.0202)
![model](https://user-images.githubusercontent.com/39788520/123760146-334dad00-d8de-11eb-977b-d93dd6e7ca24.png)

The code for this graph only, is provided here.
