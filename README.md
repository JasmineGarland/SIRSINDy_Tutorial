## Welcome to our APPM 4720-5720 Code Tutorial!

**If you need a refresher of todays presentation please follow this [link!](https://docs.google.com/presentation/d/1GRg98F1XywcRTaKcQUPaYT0xAZytR4CvTtMcDWtW5C8/edit?usp=sharing) You may also find the publication [here.](https://doi.org/10.1038/s41598-020-63877-w)**

Today we will walk through a code tutorial investigating an SIR model along with a continuous and discrete SINDy model. Please **download the code at this** [link](https://github.com/JasmineGarland/SIRSINDy_Tutorial/tree/main/CodeTutorial) which will contain five .m files. 

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
1. Run both the continuous and discrete models (the files as they are).
2. Compare the termspars
   
Spoiler: the plots may give some insight as to why we suggest completeing exercise two-five only with the continuous model.
   
Recalling in <em> Algorithmic discovery of dynamic models from infectious disease data. <em> SINDy is applied to a grid of possible values for the initial number of susceptible individuals and the sparsity knob (lambda).

**Exercise Two**
To begin this exercise, comment out lines 40 - 73 in section two of the code, we suggest using the % toggle in the matlab toolbar, and uncomment out lines 78 - 113. For mac users Command+Option+/ will uncomment out the code chunk for you, for windows users use Ctrl+Shift+R.
   
1. Fix lambda to 0.005 (done in line 78)
2. With the fixed lambda active the SOvec (this should be activated in line 79), notice how slightly larger and smaller values impact the model.

**Exercise Three**
 
Now comment out lines 78 - 113, and uncomment lines 117 - 148.
   
1. SOvec is deactivated and SO is fixed at 5E-05 (line 118).
2. Activate lambdavec (this is done in line 117), notice how sparsity impacts the model!
   
<em> Algorithmic discovery of dynamic models from infectious disease data. <em> found there is an optimal region in the plane that ensures SINDy will produce regularized, accurate models from empirical disease data.

**Exercise Four**
Now comment out lines 117 - 149, and lets go back to section 2 in the code and uncomment lines 41 - 73.
   
1. Note we are back to static values for SO and lambda (in lines 41 and 42).
2. In lines 30 - 32 uncomment the noise parameter to add noise to the data, you can do this one by one, or all together. How does this impact the results?
   
**Exercise Five**
1. Go back to lines 30 - 32 and comment out any noise you previously added. 
2. In line 11 change gamma from 1/5 to 1/10 (infectious for 10 days rather than 5), 
how does this change the graphs and what does this mean?
3. Change gamma back to 1/5 and change mu (the birthrate in line 12) from 8E-04 
to 8E-03 and then 9E-05, what do you see?
   
   
 
