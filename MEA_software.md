This document describes differences between the two MEA implementations.

|   |Ramseyer|Altmann|
|---|---|---|
|Available at|[psync.ch](https://psync.ch/downloads/), [osf.io](https://osf.io/gkzs3/)|[GitHub](https://github.com/10101-00001/MEA)|
|Platform|Windows & macOS|MATLAB|
|Software|Standalone, closed source|MATLAB, open source|
|License|Free of charge for research purposes.|No license assigned|
|ROI definition|Drawn with a tool on the playing video. Video playback can be used to verify and correct ROIs. Body part reflected by ROI needs to be noted manually. ROI definitions cannot be saved.|Drawn with a tool on a still image of the video. Accuracy for the whole video cannot be verified. ROIs are assigned a body part by default, no need to note manually. ROI definitions are saved as files automatically.|Drawn with a tool on a still image of the video. Accuracy for the whole video cannot be verified. ROIs are assigned a body part by default, no need to note manually. ROI definitions are saved as files automatically.|
|Ratio support|supports 4:3 and 16:9 ratio (different implementations)|supports any ratio|
|Noise threshold|Default threshold given, no easy way to find more exact threshold.|Noise threshold is estimated by ROI drawn in a supposedly static part of the video|
|Standardization|Not part of the software|Optional|
|Video error filtering|Integration into software unknown|Optional|
|Smoothing|Not part of the software, can easily be accomplished with R-package rMEA subsequently|Optional|
|Logarithmic transformation|Not part of the software|Optional|
|Separators used in result files|White space (space-separated values, SSV)|Tab character (tab-separated values, TSV)|

According to the authors analysis, the extracted Motion Energy data of both methods correlates highly in a research sample, with a mean correlation of *M* = .89, *SD* = .13, when encoding artifacts were filtered out of the Altmann MEA data and imputed (see graphic below). The median remained the same, with *Mdn* = .93
![MEA_comp](https://user-images.githubusercontent.com/10432441/167428194-5284da3f-bca3-45a2-9416-c02318602c8f.png)
