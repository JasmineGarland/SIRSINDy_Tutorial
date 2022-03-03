## Welcome to our APPM 4720-5720 Code Tutorial!

Today we will walk through a code tutorial investigating an SIR model along with a continuous and discrete SINDy model. Please download the code at [put link here] which will contain six .m files. 

The poolData scripts may seem familar from a previous class, however we modified the script to include the seasonal term:
   
 ![Image](/SIRSINDy_Tutorial/docs/assets/Picture1.png)
  
used in <em> Algorithmic discovery of dynamic models from infectious disease data. <em>
   
Note: remember this when you see oscillations in the plots!

The two main files we will work on today are 'main_sirmodel_continuous.m' and 'main_sirmodel_discrete.m' as there names suggest one file contains the continuous model while the other contains the discrete model.
  
**If you need a refresher of todays presentation please follow this [link!](https://docs.google.com/presentation/d/1GRg98F1XywcRTaKcQUPaYT0xAZytR4CvTtMcDWtW5C8/edit?usp=sharing) You may also find the publication [here.](https://doi.org/10.1038/s41598-020-63877-w)**


### Learning Objectives
  

```markdown
#### Today our goal is for you to learn:

- Differences in discreate and continous SINDy.
- Sensitivity of inital conditions. 
- Effects of changing the sparsity knob.
- How key parameters such as birthrate and how long an individual is for, impact the overall results.
- The impacts of noise on the data.
```

To achieve the learning objectives we have prepared the exercises below.
  
### Suggested Exercises
   
```markdown
Syntax highlighted code block

#### Exercise One
   1. Fix lambda to 0.005
   2. With the fixed lambda run the initial condition (SO in line x) as 5e-05
   3. With the fixed lambda comment out SO and active the S0vec (in line x), notice how slightly larger and smaller values impact the model.

#### Exercise Two
   
```
<>
   
   
   
### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://support.github.com/contact) and we’ll help you sort it out.
