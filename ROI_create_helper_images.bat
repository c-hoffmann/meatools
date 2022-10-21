REM (c) 2022 Christian Hoffmann

REM In order to better assess ROIs, an image is created from the overall video that illustrates the movement space of the individuals. For this purpose, images are first extracted from the video and then merged into one image.

REM Use this script by copying the *.bat-File into the folder containing a SINGLE video file (*.mp4) to be analyzed and start it from there.

REM Preconditions:
REM - ffmpeg (https://www.ffmpeg.org/) installed and added to PATH
REM - ImageMagick (https://imagemagick.org/) installed and added to PATH
REM - Enfuse/Enblend (http://enblend.sourceforge.net/) installed and added to PATH
REM Adding something to PATH ensures that it can be started from everywhere. To add something to PATH, see here: https://windowsloop.com/how-to-add-to-windows-path/


REM ### STEP 01 - FFMPEG FRAME EXTRACT ###

mkdir allimages
for /f "tokens=*" %%i in ('forfiles /S /M *.mp4 /C "cmd /c echo @file"') do set videofile=%%i
set videofile=%videofile:"=%
echo INFO: found video file "%videofile%"

cd allimages

REM Options:
REM -s reflects the resolution of the extracted images. Chosen so that it is a 2x reduction of the videos with 2704 x 1520
REM -qscale:v determines the quality of the extracted JPEG images. 2 is the best quality, 31 the worst. High quality recommended, otherwise artifacts will occur later.
REM -vf "select=not(mod(n\,5))" -vsync vfr extracts one frame per 5 frames (reduces necessary RAM and calculation time afterwards with acceptable loss of accuracy)

REM /!\ Attention: 1 frame per 5 frames leads to a very heavy load of RAM with Enfuse. It is possible that an overflow may occur. In this case reduce the frames, e.g. to 1 frame per 20 or reduce the resolution of the single frames.

ffmpeg -i "..\%videofile%" -s 1352x760 -qscale:v 2 -vf "select=not(mod(n\,10))" -vsync vfr pic%%05d.jpeg
cd ..


REM #### STEP 02 - ENFUSE / IMAGEMAGICK ####

mkdir fusedpics
REM "hardmask" helps to recognize rare conditions, "softmask" provides a good overall view.
enfuse.exe -o "fusedpics\softmask.tif" allimages\*.jpeg
enfuse.exe --hard-mask -o "fusedpics\hardmask.tif" allimages\*.jpeg

REM For comparison: ImageMagick, see https://sourceforge.net/p/enblend/discussion/420370/thread/866a65bd25/
magick convert "allimages\*" -evaluate-sequence min "fusedpics\magick_min.tif"
magick convert "allimages\*" -evaluate-sequence max "fusedpics\magick_max.tif"
magick convert "fusedpics\magick_min.tif" "fusedpics\magick_max.tif" -compose difference -composite "fusedpics\minmaxdiff.tif"
magick convert "fusedpics\minmaxdiff.tif" -resize 2704x1520 "fusedpics\minmaxdiff_resized.tif"

REM Cleanup...
del fusedpics\magick_max.tif fusedpics\magick_min.tif
rmdir allimages /s /q

REM #### STEP 03 - CREATE VIDEO ####
REM Create video from the fused picture to allow defining ROI with Altmann MEA
(for /L %%i in (1,1,1000) do @echo file 'fusedpics\minmaxdiff_resized.tif') > piclist.txt
ffmpeg -y -r 60 -f concat -safe 0 -i "piclist.txt" -q:v 1 minmaxdiff.avi
del piclist.txt
del fusedpics\minmaxdiff_resized.tif

echo Script finished.
pause
