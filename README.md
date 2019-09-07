# GBM-saliency-detection
Automatic computerized detection of regions of interest or Glioma tumors using saliency detection model.
The automatic computerized detection of regions of interest (ROI) is an important step in the process of medical image 
processing and analysis. The reasons are many, and include an increasing amount of available medical imaging data, 
existence of inter-observer and inter-scanner variability, and to improve the accuracy in automatic detection in order 
to assist doctors in diagnosing faster and on time. A novel algorithm, based on visual saliency, is developed here for 
the identification of tumor regions from MR images of the brain. The GBM saliency detection model is designed by taking 
cue from the concept of visual saliency in natural scenes. A visually salient region is typically rare in an image, and 
contains highly discriminating information, with attention getting immediately focused upon it. Although color is 
typically considered as the most important feature in a bottom-up saliency detection model, we circumvent this issue in 
the inherently gray scale MR framework. We develop a novel pseudo-coloring scheme, based on the three MRI sequences, viz. 
FLAIR, T2 and T1C (contrast enhanced with Gadolinium). A bottom-up strategy, based on a new pseudo-color distance and 
spatial distance between image patches, is defined for highlighting the salient regions in the image. This multi-channel 
representation of the image and saliency detection model help in automatically and quickly isolating the tumor region, 
for subsequent delineation, as is necessary in medical diagnosis.
