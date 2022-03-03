## Welcome to our APPM 4720-5720 Code Tutorial!

**If you need a refresher of todays presentation please follow this [link!](https://docs.google.com/presentation/d/1GRg98F1XywcRTaKcQUPaYT0xAZytR4CvTtMcDWtW5C8/edit?usp=sharing) You may also find the publication [here.](https://doi.org/10.1038/s41598-020-63877-w)**

Today we will walk through a code tutorial investigating an SIR model along with a continuous and discrete SINDy model. Please download the code at [put link here] which will contain six .m files. 

The poolData scripts may seem familar from a previous class, however we modified the script to include the seasonal term:
   
 ![Image](/SIRSINDy_Tutorial/docs/assets/Picture1.png)
  
used in <em> Algorithmic discovery of dynamic models from infectious disease data. <em>
   
Note: remember this when you see oscillations in the plots!

The two main files we will work on today are **main_sirmodel_continuous.m** and **main_sirmodel_discrete.m** as there names suggest one file contains the continuous model while the other contains the discrete model.
  

### Learning Objectives
 

- Differences in discreate and continous SINDy.
- Sensitivity of inital conditions. 
- Effects of changing the sparsity knob.
- How key parameters such as birthrate and how long an individual is for, impact the overall results.
- The impacts of noise on the data.


To achieve the learning objectives we have prepared the exercises below.
  
### Suggested Exercises

   **For exercises two-five we sugguest using the continuous model at first, and then move to the discrete model if there is time.**


**Exercise One**
1. Run both the continuous and discrete models.
2. Compare the termspars
Spoiler: the plots may give some insight as to why we suggest completeing exercise two-five only with the continuous model.
   
Recalling in <em> Algorithmic discovery of dynamic models from infectious disease data. <em> SINDy is applied to a grid of possible values for the initial number of susceptible individuals and the sparsity knob (lambda).

**Exercise Two**
1. Fix lambda to 0.005 (in line x)
2. With the fixed lambda run the initial condition (SO in line x) as 5E-05
3. With the fixed lambda comment out SO and active the SOvec (in line x), notice how slightly larger and smaller values impact the model.

**Exercise Three**
 
1. Deactivate SOvec and change SO to be fixed at 5E-05
2. Deactivate lambda (in line x)
3. Activate lambdavec, notice how sparsity impacts the model
   
<em> Algorithmic discovery of dynamic models from infectious disease data. <em> found there is an optimal region in the plane that ensures SINDy will produce regularized, accurate models from empirical disease data.

**Exercise Four**
1. Deactive lambdavec and set lambda back to 0.005 (line x)
2. In line x and x uncomment the noise parameter to add noise to the data, 
how does this impact the results?
   
**Exercise Five**
1. Comment the noise parameters back out in line x and x. 
2. In line x change g from 1/5 to 1/10 (infectious for 10 days rather than 5), 
how does this change the graphs and what does this mean?
3. Change g back to 1/5 and change mu (the birthrate in line x) from 8E-04 
to 8E-03 and then 9E-05, what do you see?
   
   
 
