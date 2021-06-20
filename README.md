# Time_Series_Forest_Fire

#### Introduction	
For my global warming study I used wildfire data from the National Centers for Environmental Information (NCEI) to examine the number of fires and acres burned from the years 2000 – 2021 within the United States.	We can evaluate the data on a macro level for a trend in wildfires. Discovering a trend can lead to better preparation as well as act as a form of benchmarking previous strategies, “ Economic losses attributed to wildfires in 2018 alone are almost equal to the collective losses from wildfires incurred over the past decade…” (Fawzy et al., 2020). Wildfires themselves can lead to other issues such as health concerns from the smoke inhalation as well as further environmental degradation of already environmentally sensitive areas, “wildfire threatens surface drinking water sources with eroded contaminants” (Gannon et al., 2020).

#### Time Series Application.
When evaluating the variables within our dataset we notice that there is a correlation between the spokes of acres and numbers of fires, viewable in Figure 2 below when using acres burned per fire as the base line we can see the spokes of acres burned matching with number of fires however at different scales. The acres burned contains the most variance out of all the variables so we will use that as our evaluation metric for our Auto Regressive Integrated Moving Average (ARIMA) time series analysis.


![image](https://user-images.githubusercontent.com/58121111/122681186-2c79b880-d1c1-11eb-93d3-b873a721151e.png)


![image](https://user-images.githubusercontent.com/58121111/122681203-40251f00-d1c1-11eb-90c9-666cb60055eb.png)
 

Our first ARIMA model (0,1,0) has an uneven distribution of residuals as well as a significant lag spike at 1 and another close one at 4 producing a p-value of 0.004 shown in Figure 3. Adjusting the p, d, and q of the ARIMA function we produced another time series model, ARIMA (1,2,1) using 5 lags producing a p-value of 0.035. Here we notice a more even distribution but there is still a significant spike at lag 4 shown in Figure 6. With the first model, ARIMA(0,1,0), we get a forecast that appears to capture most of the variance but is clearly heavily influenced by the major spike. However, in the second forecast which used ARIMA(1,2,1) shows a model that appears to take the spike into account with a slight spread increase of the deviation predicted around 2023 – 2024 but it also shows the decreasing trend show slightly in the trends but missed by all the other models. Due to this I believe this model was the better of the two model. To evaluate this model I compared it by benchmarking it against a ARIMA(0,0,0) model to check our summary. Comparing our chosen model we notice that the ARIMA(0,0,0) function fails to account for the spike, only taking into account the cyclic spikes as well as missing the trend within the dataset.


![image](https://user-images.githubusercontent.com/58121111/122681221-5206c200-d1c1-11eb-8310-44c0a17589f6.png)


![image](https://user-images.githubusercontent.com/58121111/122681231-60ed7480-d1c1-11eb-81dd-3b4edc34e563.png)


![image](https://user-images.githubusercontent.com/58121111/122681261-6fd42700-d1c1-11eb-9907-d6354a277d15.png)
 

![image](https://user-images.githubusercontent.com/58121111/122681287-85495100-d1c1-11eb-880f-ae7a418ed341.png)


![image](https://user-images.githubusercontent.com/58121111/122681294-91cda980-d1c1-11eb-842f-13e502b7da4d.png)


![image](https://user-images.githubusercontent.com/58121111/122681317-a447e300-d1c1-11eb-9d6a-1bc054a27c12.png)


#### Conclusions
Using this dataset we ran dynamic regression and ARIMA model on the dataset to predict potential future fires impact. We noticed an overall downward trend across the country in wildfires however we can still expect spikes despite the trend. “…Centre for Research on the Epidemiology of Disasters (CRED)… CRED also provides data on disasters over the past decade, which shows even higher annual averages in almost all areas, except for wildfire cases” (Fawzy et al., 2020).  I believe this is due to the interconnected nature of wildfires and climate change as each wildfire can directly worsen the climate leading to more wildfires, “… wildfires are a direct source of CO2 emissions. Although wildfires are part of the natural system, it is clear that human-induced emissions are directly interfering and amplifying the impact of natural system emissions” (Fawzy et al., 2020). This is a macro level evaluation on wildfires in the US and does not account for singular devastations such as in California where on a micro level the wildfires have increased in devastation and occurrence, “two largest contemporary wildfires, and two most destructive wildfires all occurred during 2017 and 2018” (Goss et al., 2020).  These wildfires need to not just be prevented but also be contained when they happen contain the risks associated, “…improved fire containment could reduce wildfire risk to the water source by 13.0 to 55.3% depending on impact measure and post-fire rainfall” (Gannon et al., 2020). Overall the downward trend with spikes shows the harsh reality that we are making progress in fighting climate change, indicated in the downward trend, however the worsening of the climate has means we can predict the worsening of disasters, “Climate change can thus be viewed as a wildfire ‘threat multiplier’ amplifying natural and human risk factors that are already prevalent throughout California” (Goss et al., 2020).






#### References
Fawzy, S., Osman, A. I., Doran, J., & Rooney, D. W. (2020). Strategies for mitigation of climate change: a review. Environmental Chemistry Letters. https://doi.org/10.1007/s10311-020-01059-w

Gannon, B. M., Wei, Y., & Thompson, M. P. (2020). Mitigating Source Water Risks with Improved Wildfire Containment. Fire, 3(3), 45. https://doi.org/10.3390/fire3030045

Goss, M., Swain, D. L., Abatzoglou, J. T., Sarhadi, A., Kolden, C., Williams, A. P., & Diffenbaugh, N. S. (2020). Climate change is increasing the risk of extreme autumn wildfire conditions across California. Environmental Research Letters, 15(9). https://doi.org/10.1088/1748-9326/ab83a7


