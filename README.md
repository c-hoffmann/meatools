# MEA Tools
Tools and documents to assist in the usage of MEA (motion energy analysis).

MEA-Implementations by
* Dr. phil. Fabian Ramseyer ([psync.ch](https://psync.ch/downloads/), [OSF](https://osf.io/gkzs3/))
* Dr. phil. Uwe Altmann ([GitHub](https://github.com/10101-00001/MEA))

For details on the differences of these two implementations, see [`MEA_software.md`](https://github.com/c-hoffmann/meatools/blob/main/MEA_software.md)

## Create helpful images to determine ROIs in video
`ROI_create_helper_images.bat` can be used to create images that represent motion in a video file. This can help to determine the correct ROI definition. Especially helpful with the Altmann implementation (in comparison with Ramseyer implementation), since it doesn't allow watching the whole video with the ROIs overlayed.
### Example image
![ROIhelperimages](https://user-images.githubusercontent.com/10432441/167422288-fd374b7b-4699-4a79-82ad-434bbb000e26.png)
*Note*: Face in c was blurred for anonymity. ImageMagick created image a, Enfuse created images b and c. While a and b support defining the ROI borders as to not miss any movement, c is helpful in estimating the general regions of head and body, on which ROI-separating boundaries can be based.
### Preconditions
* ImageMagick (https://imagemagick.org/) installed and added to PATH
* ffmpeg (https://www.ffmpeg.org/) installed and added to PATH (if not automatically done by installing ImageMagick)
* Enfuse/Enblend (http://enblend.sourceforge.net/) installed and added to PATH
### Usage
Copy `ROI_create_helper_images.bat` into the folder containing a SINGLE video file (*.mp4) to be analyzed and start it from there.

## Affilliation
* The author of this repository is the operator of the [Interaction lab](https://www.uniklinik-freiburg.de/psychosomatik/sektionen/systemische-gesundheitsforschung/interaktionslabor.html) of the [Department of Psychosomatic Medicine and Psychotherapy](https://www.uniklinik-freiburg.de/psychosomatik.html) of the [Medical Center](https://www.uniklinik-freiburg.de/), [University of Freiburg](https://uni-freiburg.de/), Germany
