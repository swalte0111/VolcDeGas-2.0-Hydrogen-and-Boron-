Manual VolcDeGas 2.0

This manual is based on the published program code of ”VolcDeGas: A program for modeling hydrogen isotope fractionation during degassing of rhyolitic melts” in Walter and Castro (2020); Volcanica, and is hereby updated to include the boron isotopic system.

The program VolcDeGas was developed in MATLAB R2018a/b and is fully downwards compatible with MATLAB versions as early as R2012a. It requires the Signal Processing Toolbox as well as the Statistics and Machine Learning Toolbox. However, the compiled self-installer version does not require MATLAB and can run independently (Windows systems only). 

The following files are necessary for running the program:

    VolcDeGas.m
    VolcDeGas.fig
    VolcDeGasopion.m
    VolcDeGasopion.fig

These files should be stored in a folder which is accessible by MATLAB (or added to the MATLAB path). The program can be launched by typing VolcDeGas in the MATLAB command window. Windows users can alternatively execute the compiled version by running VolcDeGas.exe. 

8.8 Code overview

VolcDeGas provides a user-friendly graphical user interface (GUI) to simply import datasets and modify parameters for analyzing degassing systems. The GUI includes buttons and fields with illuminating tooltips that direct the users through the programs functions and provide additional guidance. Users can calculate one- and two-stage degassing histories either manually “by-hand” or automatically. The automatic mode establishes the best-fit degassing scenario by minimizing the Root-Mean-Square-Error (RMSE) between calculated degassing trends and natural sample data.

Users are advised to set broad parameter ranges, particularly for initial δD values, which control the generation of parallel graphs (e.g., -80 ‰ to -20 ‰ with a 1 ‰ interval) to ensure a wide range of explored degassing histories. Extensive testing on rhyolitic systems has demonstrated the program's excellent performance, specifically in automatically identification of the best-matching degassing histories.

8.8.1 Usage instructions and input

The user must first select the isotopic system of interest (δD or δB) by clicking the corresponding button in the top left of the GUI. Although the basic calculations for the hydrogen and boron systems are similar, their terminology differs a bit. Therefore, the following paragraph explains the usage of both systems.

It is important to clear the workspace by invoking the "Clear workspace for next run" button and closing all open figures, before initiating a new calculation. This step is particularly important when utilizing different step sizes or when switching between systems employing variable step sizes and systems which utilize fixed steps. For two-stage manual calculations, the workspace should only be cleared after completing the second stage calculations, and other processes such as exporting of the calculated data to excel or making layout adjustments such as font size changes. 

The program is written in a user-friendly manner. That is that guidelines are provided to the user through tooltips that appear when hovering over buttons and fields, as well as through error messages. These features help to prevent mistakes, such as missing input variables or an incorrect sequence of controls. Conditional checks by if-loops and safeguards inserted in the code also mitigate the risk of crashes. For extensive computations which can be time-consuming and depend on the computer’s speed, a progress bar is displayed to inform about the program's status, signaling that the process is ongoing.

For any hydrogen system analysis, whether automatically or manual, it is generally advised that additional water speciation data is employed to calculate improved alpha factors. This data is imported by invoking the button “Input own speciation values …”, with an excel sheet, whereas the first row of the sheet should contain the total water content in weight percent (wt.%), and the second row should list the molecular water content in wt.%. For boron system analyses, speciation data is not required, as these calculations rely solely on temperature input and are unrelated to concentration changes. When inputting natural δD or δB data by pressing the button: “Input excel”, the Excel sheet's first row must include bulk water content in wt.% or boron concentration in ppm, while the second row must contain the corresponding δD or δB values, a procedure which is a requirement for every automated calculation. In case the user applies speciation data to the hydrogen system, the alpha factor (α-factor) is calculated without reference to temperature, but the temperature field must still be filled with a placeholder value to ensure proper execution.

The program also accounts for specific constraints in the calculation process such as dividing by 0. For instance, if the final bulk water or boron content field (tagged with “From”) is set to 0, the program automatically replaces this value with one close to zero (0.00001) to prevent errors. Users are instructed to set the field to 0, as this yields accurate results without increasing processing times.

The step size is another necessary parameter whereas changes in the step size interval have no effect on closed system-, and minimal effect open system-calculations. As excessively large step sizes can produce jagged, and less smooth graphs, users are encouraged to use smaller step sizes, such as 0.001 for water and 0.1 for boron to produce high resolution graphs, especially when employing automatic best-fit calculations. The batched system with variable step size dynamically adjusts step sizes during calculations, so the manual and fixed input values are not considered in this system. The batched system with constant step size, is the sole system heavily influenced by the selection of step sizes intervals.  

In two-stage degassing systems, and especially for automatically computations, the transition point must be specified to account for closed-system limits. A pre-set value is applied in the program which is a rough estimate of the average transition point values based on past works. However, the suggested transition point, entered in the "Set most likely transition point" field, should always be lower than the natural data values. The program then calculates the best-fit transition point along the closed-system trajectory. If the natural data is limited or scarce, a manual identification of the best-fit system may be required. This can be accomplished with the second GUI, "VolcDeGasopions," which provides supplementary features for manual adjustments, second stage calculations, data exportation, and layout customization.

By following these guidelines and employing the program's default values where applicable, users can accomplish optimal performance and correctness across various systems. In case of any unexpected behavior or program crashes, pressing "Clear workspace for next run" and closing all open figures will resolve most problems effectively.

