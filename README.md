# Boundary_Condition
Several boundary conditions for suppressing the ringing effect.
All of this .m files are run in Matlab.
The function format is as follows:
    function ret =XXXBC(img,pad_h,pad_v)
The img is the input image, which can be rgb or gray.pad_h and pad_v are the width of the image to be expanded horizontally and vertically.ret means the expanded image.
add the file XXXBC.m to Matlab path and call it is enough.

antiBC.m :antireflection Bondary Condition,see more at:<Antireflective boundary conditions for deblurring problems>
GongBC.m : see more at <龚梦欢.图像复原的边界振铃效应抑制算法>
LiuBC.m : see more at <Renting Liu.REDUCING BOUNDARY ARTIFACTS IN IMAGE DECONVOLUTION>
NeumannBC.m Assume that the outside information is symmetrical with internal information along the boundary.
periodBC.m :Assume that the image(signal) is Cyclical.
repeatBC.m :see more at <Xu Zhou.A boundary condition based deconvolution framework forimage deblurring>
shiftBC.m :see more at <黄捷.基于移位反射边界条件的图像复原>
zeroBC.m : Assume that the information outside the image is 0.
ZhaoBC.m :see more at <赵明华.正弦积分拟合的图像复原边界振铃效应抑制方法>
