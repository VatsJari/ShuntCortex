# 🧪 Shunt Project: Marker Quantification & Visualization

This repository contains an R script used for analyzing and visualizing cell marker data across multiple timepoints from the **Shunt Project**. Specifically, the script processes marker expression data (GFAP, Neun, Iba1, Olig2) and creates bar plots for both **absolute counts** and **percentages** of DAPI.

---

## 📁 File Structure

```
📦ShuntCortex/
 ┣ 📜 Analysis.R         # Main analysis and plotting script
 ┗ 📊 #excel.sheet.xlsx                   # Raw Excel data (not included in public repo)
```

---

## 🧬 Markers Analyzed

- **GFAP**: Glial fibrillary acidic protein (astrocyte marker)
- **Neun**: Neuronal marker
- **Iba1**: Microglial marker
- **Olig2**: Oligodendrocyte lineage marker

Data is recorded over multiple **Timepoints** (e.g., DIV - Days In Vitro) and visualized as:

- 📊 **Raw Cell Counts**
- 📈 **Percentages (% of DAPI)**

---

## 📊 Output Plots

The script generates four plots:
1. **Iba1 & Olig2 Cell Counts**
2. **GFAP & Neun Cell Counts**
3. **Iba1 & Olig2 Percentages**
4. **GFAP & Neun Percentages**

Plots are combined using `cowplot` for comparative visualization.

---

## 🛠 Dependencies

Ensure the following R packages are installed:

```r
install.packages(c("tidyverse", "readxl", "cowplot"))
# Seurat for NoLegend
if (!requireNamespace("Seurat", quietly = TRUE)) {
  install.packages("Seurat")
}
```

---

## 🚀 Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/shunt-marker-analysis.git
   cd shunt-marker-analysis
   ```

2. Open `Analysis.R` in RStudio or your R environment.

3. Modify the Excel file path if needed:
   ```r
   read_excel("path/to/#excel.sheet.xlsx", sheet = ...)
   ```

4. Run the script to generate the plots.

---

## Author

Vatsal D. Jariwala
University Hospital Freiburg
Germany
