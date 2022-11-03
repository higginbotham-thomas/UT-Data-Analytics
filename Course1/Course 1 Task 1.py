#!/usr/bin/env python
# coding: utf-8

# In[50]:


import pandas as pd
#import numpy as np
from sklearn.preprocessing import KBinsDiscretizer
from feature_engine.discretisation import EqualWidthDiscretiser


# In[51]:


data = pd.read_csv('Demographic_Data.csv')


# In[52]:


data.head()


# In[53]:


data.describe()


# In[54]:


data.info()


# In[55]:


data = data.drop_duplicates()


# In[56]:


print(data.isnull().sum())


# In[57]:


data.dtypes


# In[58]:


# set up the discretisation transformer
disc = EqualWidthDiscretiser(bins=10, variables=['age', 'items', 'amount'])

# fit the transformer
disc.fit(data)


# In[59]:


disc.transform(data)


# In[60]:


disc.binner_dict_


# In[61]:


print(disc)


# In[62]:


from feature_engine.discretisation import EqualFrequencyDiscretiser


# In[63]:


disc = EqualFrequencyDiscretiser(q=10, variables = ['age','items','amount'])

disc.fit(data)


# In[64]:


disc.transform(data)


# In[65]:


print(data)


# In[66]:


disc.binner_dict_


# In[70]:


from sklearn.preprocessing import KBinsDiscretizer


# In[81]:


disc = KBinsDiscretizer(n_bins=3, encode='ordinal',strategy='kmeans')


# In[82]:


disc.fit(data)


# In[79]:


disc.transform(data)


# In[85]:


from sklearn.model_selection import train_test_split
from feature_engine.discretisation import DecisionTreeDiscretiser


# In[87]:


# cross-validation number (cv)
# how to evaluate model performance (scoring)
# the variables we want to discretise (variables)
# whether it is a target for regression or classification
# and the grid with the parameters we want to test
treeDisc = DecisionTreeDiscretiser(cv=10, scoring='accuracy',
variables=['age', 'items', 'amount'],
regression=False,
param_grid={'max_depth': [1,2,3],
'min_samples_leaf':[10,4]})

treeDisc.fit(data)


# In[ ]:




