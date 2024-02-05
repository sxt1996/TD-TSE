# TD-TSE
open source codes of paper:《Target Detection Through Tree-Structured Encoding for Hyperspectral Images》

DOI: 10.1109/TGRS.2020.3024852
# Abstract
Target detection aims to locate targets of interest within a specific scene. The traditional model-driven detectors based on signal processing have proved to be very effective. However, the detection performance of such traditional methods relies heavily on the model assumption, which is limited by the discrepancy with real HSI data. In this paper, a target detection method through tree-structured encoding (TD-TSE) for hyperspectral images (HSIs) is proposed. Instead of modeling the target and background to extract valid features, we construct a binary tree based on the features of the data itself and segment the HSI in order to improve the separability of the target and background. For the purpose of highlighting the target and suppressing the background, a novel measurement of separation, distance on tree, is calculated via binary encoding based on the constructed tree structure, and the detection output can be obtained according to such distance. To further reduce the generalization error resulting from random subsampling, the statistical average of the distances on multiple independent trees is estimated to improve the robustness of TD-TSE. The proposed method is not constrained by any model assumptions, which is fundamentally different from the most widely used hyperspectral target detectors in the field of signal processing. Moreover, the construction of binary trees without any labeled samples and the linear complexity of the proposed method make it highly practical for hyperspectral data in real scenes. Extensive experiments on three benchmark HSI datasets demonstrate the effectiveness of the proposed TD-TSE for hyperspectral target detection.
# Index Terms
Hyperspectral image, target detection, binary trees, encoding.
# Flowchart
![flowchart](https://github.com/sxt1996/TD-TSE/assets/55687887/212e3989-a284-424a-9182-567023a44ce7)
# Data Set
AVIRIS-1: The data set was captured by the Airborne Visible/Infrared Imaging Spectrometer (AVIRIS) over San Diego. The original image includes 224 spectral channels in the wavelength range of  370 to 2510 nm. We reserved 189 bands in the experiments, leaving out the water absorption bands and low SNR bands. The full image of the urban scene contains 400×400 pixels and the spatial resolution is 3.5m. The AVIRIS-1 used in our experiments is a sub-image with 100×100 pixels. And there are three airplanes regarded as targets occupying 22, 22, and 20 pixels respectively.
# Guidelines
1. Install R2014a or higher versions of MATLAB.
2. Download this code package.
3. Set path.
4. Don't worry about importing data or anything else, just run Main.m.
# Contact
If you have any questions, please feel free to contact me.
sxt1996@outlook.com
